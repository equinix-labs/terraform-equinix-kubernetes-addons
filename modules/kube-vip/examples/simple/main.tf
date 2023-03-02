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

provider "kubectl" {
  config_path = var.kubeconfig_local_path
}

module "equinix_kubernetes_addons" {
  source = "../../../../"

  # equinix_project = "" // Equinix Metal project ID. Required only if kube_vip_config.cpem_installed is false.

  enable_kube_vip = true
  # kube_vip_config = {
  #   # version = "v5.10.0" //if not specified it will get latest available
  #   # cpem_installed = true //Set true if cloud-provider-equinix-metal addon is being enabled in the module or is already running on the kubernetes cluster. Defaults to true
  #   # metal_key = var.metal_auth_token // required only if cpem_installed is false.
  # }
}
