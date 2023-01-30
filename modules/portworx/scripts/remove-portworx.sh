#!/usr/bin/env bash
set -u
set -o pipefail
. vars

vPXStrgClstrName="px-cluster";
"${kbCtl}"  --kubeconfig="${vKubeConfig}" patch   storagecluster "${vPXStrgClstrName}" --namespace portworx -p '{"spec":{"deleteStrategy":{"type":"UninstallAndWipe"}}}' --type=merge
"${kbCtl}"  --kubeconfig="${vKubeConfig}" delete  StorageCluster "${vPXStrgClstrName}" --namespace portworx &
sleep 10
echo "Wating for portworx cleanup proces to finish. It will take about 5 minutes..."
sleep 300;
echo "Removing portworx operator..."
"${kbCtl}"  --kubeconfig="${vKubeConfig}" delete  -f "${vPX_Operator_File}" & 
sleep 10;
