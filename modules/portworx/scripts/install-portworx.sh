#!/usr/bin/env bash
set -e -u
set -o pipefail
. vars

PX_KVDB_DEVICE="$(echo "${PX_KVDB_DEVICE}" | tr '[:upper:]' '[:lower:]'|xargs)";

if [[ "${PX_KVDB_DEVICE}" == "" ]]; then 
  sed -i_sedtmp "/    kvdbDevice: XX_PX_KVDB_DEVICE_XX/d" "${vPX_Storage_Cluster_File}";
elif [[ "${PX_KVDB_DEVICE}" == "auto" ]]; then 
  sed -i_sedtmp "s,XX_PX_KVDB_DEVICE_XX,/dev/pwx_vg/pwxkvdb,g" "${vPX_Storage_Cluster_File}";
else 
  sed -i_sedtmp "s,XX_PX_KVDB_DEVICE_XX,${PX_KVDB_DEVICE},g" "${vPX_Storage_Cluster_File}";
fi
rm *_sedtmp

vMasters="$("${kbCtl}" --kubeconfig="${vKubeConfig}" get node --selector='node-role.kubernetes.io/control-plane' --no-headers=true -o custom-columns=":metadata.name")";
"${kbCtl}" --kubeconfig="${vKubeConfig}" cordon ${vMasters};

echo "Installing PortWorx Operator"
"${kbCtl}" --kubeconfig="${vKubeConfig}" apply -f "${vPX_Operator_File}"        ; sleep 30;

echo "Installing Portworx storage cluster"
"${kbCtl}" --kubeconfig="${vKubeConfig}" apply -f "${vPX_Storage_Cluster_File}" ; sleep 30;

${kbCtl} --kubeconfig="${vKubeConfig}" get nodes
