# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
module "equinix_kubernetes_addons" {
  source = "../../../../"

  equinix_project = var.project
  equinix_metro   = "LV"

  ssh_host        = var.host
  ssh_user        = var.user
  ssh_private_key = file(var.private_key_path)

  kubeconfig_remote_path = var.kubeconfig_remote_path
  kubeconfig_local_path  = var.kubeconfig_local_path

  enable_rook = true
  rook_config = {
    rook_ceph_name              = "rook-ceph"
    rook_ceph_namespace         = "rook-ceph"
    rook_ceph_cluster_name      = "rook-ceph-cluster"
    rook_ceph_cluster_namespace = "rook-ceph"
  }
}
provider "equinix" {
  auth_token = var.metal_auth_token
}
