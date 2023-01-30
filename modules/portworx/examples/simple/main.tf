# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).
#
provider "equinix" {
  auth_token = var.metal_auth_token
}

module "equinix_kubernetes_addons" {
  source = "../../../../"

  equinix_project = var.metal_project_id
  equinix_metro   = "SV"

  ssh_host        = var.host
  ssh_private_key = file(var.private_key_path)

  kubeconfig_remote_path = var.kubeconfig_remote_path

  enable_portworx = true

  portworx_config = {
    metal_auth_token    = null
    ssh_user            = "root"
    k8s_version         = "1.23"
    cp_node_count       = "1"
    cluster_name        = "px-cluster"
    kubespray_version   = "2.20"
    px_operator_version = "1.10.2"
    px_stg_version      = "2.12.1"
    px_security         = false
    ssh = {
      host             = var.node_names
      worker_addresses = var.node_ips
      private_key      = var.private_key_path
      user             = var.node_user
      kubeconfig       = var.kubeconfig_local_path
    }
  }
}
