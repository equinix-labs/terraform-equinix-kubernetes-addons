#!/usr/bin/env bash
set -u
set -o pipefail

PX_VG_NAME=pwx_vg
PX_LV_NAME=pwxkvdb

CHECK_EXISTING=$(lvs --select vg_name=${PX_VG_NAME} -o"lv_name" --noheadings |xargs||true)
if [[ "${CHECK_EXISTING}" == "" ]]; then 
  DSK_SIZE="0"
  DISKS=$(lsblk -f -d -b -n  -oNAME,SIZE,FSTYPE| egrep -v "xfs|ext3|ext4|btrfs|sr0|swap|loop" | sort -n -k2)

  if [[ "${DISKS}" != "" ]]; then 
    while IFS= read -r line; do
      TMP_SIZE=$(echo $line|awk {'print $2'})
      TMP_NAME=$(echo $line|awk {'print $1'})
      if lsblk -f -b -n  -oNAME,SIZE,FSTYPE -i /dev/$TMP_NAME | egrep "xfs|ext3|ext4|btrfs|sr0|swap|loop" > /dev/null || ! wipefs -n -a /dev/$TMP_NAME 2>&1 >/dev/null; then
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
    if [[ -z "${DSK_NAME// }" ]]; then
      echo "No device found to create Portworx KVDB LVM device!"
      exit 1
    fi
    echo -e "Creating $DSK_NAME for Portworx KVDB LVM."
    DEV="/dev/$DSK_NAME"
    wipefs -a $DEV
    pvcreate -y  $DEV
    vgcreate -y ${PX_VG_NAME} $DEV
    lvcreate -y -l 100%FREE -n ${PX_LV_NAME} ${PX_VG_NAME}
  else
    echo "No device found to create Portworx KVDB LVM device!"
    exit 1
  fi
else
  echo "Portworx KVDB LVM device already exist!"
fi
exit 0;
