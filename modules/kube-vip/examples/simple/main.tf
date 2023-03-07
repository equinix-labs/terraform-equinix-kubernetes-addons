# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).
#
provider "kubectl" {
  config_path = var.kubeconfig_local_path
}

module "equinix_kubernetes_addons" {
  source = "../../../../"

  equinix_project = var.metal_project_id # Equinix Metal project ID. Required ONLY IF kube_vip_config.cpem_installed is `false`

  enable_kube_vip = true

  kube_vip_config = {
    # version = "v0.5.11" # if not specified it will get latest version. v0.5.11 is the minium supported version
    cpem_installed = var.cpem_installed   # set `false` if cloud-provider-equinix-metal addon is NOT being enabled in the module or CPEM is NOT already running on the kubernetes cluster. If `kube_vip_config.cpem_installed` is not specified it defaults to `true`
    metal_key      = var.metal_auth_token # required ONLY IF kube_vip_config.cpem_installed is `false`
  }
}
