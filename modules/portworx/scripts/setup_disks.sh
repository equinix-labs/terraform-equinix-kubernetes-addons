#!/usr/bin/env bash
set -u
set -o pipefail
OPERATION="${1}"

PX_VG_NAME=pwx_vg
PX_LV_NAME=pwxkvdb

if [[ "${OPERATION}" == "create" ]]; then
  CHECK_EXISTING=$(lvs --select vg_name=${PX_VG_NAME} -o"lv_name" --noheadings |xargs||true)
  if [[ "${CHECK_EXISTING}" == "" ]]; then 
    DSK_SIZE="0"
    DISKS=$(lsblk -f -d -b -n  -oNAME,SIZE,FSTYPE| egrep -v "xfs|ext3|ext4|btrfs|sr0|swap" | sort -n -k2)

    if [[ "${DISKS}" != "" ]]; then 
      while IFS= read -r line; do
        TMP_SIZE=$(echo $line|awk {'print $2'})
        TMP_NAME=$(echo $line|awk {'print $1'})
	if lsblk -f -b -n  -oNAME,SIZE,FSTYPE -i /dev/$TMP_NAME | egrep "xfs|ext3|ext4|btrfs|sr0|swap" > /dev/null; then
	  echo -e "Skipping $TMP_NAME."
	  continue
	fi
        if [[ "$DSK_SIZE" = "0" ]]
          then
            DSK_SIZE=$TMP_SIZE
            DSK_NAME=$TMP_NAME
        elif [[ "$DSK_SIZE" -gt "$TMP_SIZE" ]]
          then
            DSK_SIZE=$TMP_SIZE
            DSK_NAME=$TMP_NAME
        fi
      done <<< "$DISKS"

      echo -e "Creating $DSK_NAME for Portworx KVDB LVM."
      DEV="/dev/$DSK_NAME"
      wipefs -a $DEV
      pvcreate -y  $DEV
      vgcreate -y ${PX_VG_NAME} $DEV
      lvcreate -y -l 100%FREE -n ${PX_LV_NAME} ${PX_VG_NAME}
    else
      echo "No device found to create Portworx KVDB LVM device!"
    fi
  else
    echo "Portworx KVDB LVM device already exist!"
  fi
elif [[ "${OPERATION}" == "delete" ]]; then
  DEV=$(lvs --select vg_name=${PX_VG_NAME} -o devices |tail -1 | xargs | sed 's,(.*),,g'||true)
  if [[ "${DEV}" != "" ]]; then 
    echo "Deleting Portworx KVDB LVM device: '/dev/${PX_VG_NAME}/${PX_LV_NAME}'"
    systemctl stop portworx
    systemctl disable portworx
    rm -f /etc/systemd/system/portworx*
    grep -q '/opt/pwx/oci /opt/pwx/oci' /proc/self/mountinfo && umount /opt/pwx/oci
    pxctl service node-wipe --all
 ## No need to execute following lines, pxctl service node-wipe --all is taking care of those.
    #  lvremove -y /dev/${PX_VG_NAME}/${PX_LV_NAME}
    #  vgremove ${PX_VG_NAME}
    #  pvremove $DEV
    wipefs -a $DEV
  else
    echo "Portworx KVDB LVM device does not exist."
    exit 0
  fi
else
  echo -e "\nUnknown or missing parameter!";  echo -e "\nUsage:\n  $0 [create|delete]\n"
  exit 1
fi
exit 0;
