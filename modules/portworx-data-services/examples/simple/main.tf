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

  enable_portworx_data_services = true

  portworx_data_services_config = {
    pds_account_id = var.pds_account_id
    pds_token      = var.pds_token
    pds_tenant_id  = var.pds_tenant_id
    pds_name       = var.pds_name
  }
}
