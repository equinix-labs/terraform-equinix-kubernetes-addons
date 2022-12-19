# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
module "terraform-equinix-kubernetes-addons" {
  source = "../../../../"

  equinix_project = var.project
  equinix_metro   = "LV"

  ssh_host        = var.host
  ssh_user        = var.user
  ssh_private_key = file(var.private_key_path)

  kubeconfig_remote_path = var.kubeconfig_remote_path
  kubeconfig_local_path  = var.kubeconfig_local_path

  enable_rook = true
}
provider "equinix" {
  auth_token = var.auth_token
}
