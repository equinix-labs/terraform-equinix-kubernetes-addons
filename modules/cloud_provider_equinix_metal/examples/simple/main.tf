# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).
#

module "terraform_equinix_kubernetes_addons" {
  source = "../../../../"

  equinix_project = var.metal_project_id
  equinix_metro   = "SV"

  ssh_host        = var.ssh_host
  ssh_user        = var.ssh_user
  ssh_private_key = file(var.private_key_path)

  kubeconfig_remote_path = var.kubeconfig_remote_path

  enable_cloud_provider_equinix_metal = true

  cloud_provider_equinix_metal_config = {
    version = "v3.5.0"
    secret = {
      "apiKey"    = var.metal_auth_token
      "projectID" = var.metal_project_id
    }
  }
}
