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

  kubeconfig_local_path = var.kubeconfig_local_path

  enable_portworx = true

  portworx_config = {
    px_operator_version = "1.10.3"
    px_stg_version      = "2.12.2"
    px_security         = false
    worker_nodes        = var.worker_nodes
  }
}
