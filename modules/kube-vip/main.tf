# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE: Before using "provider" blocks, consider https://www.terraform.io/docs/language/modules/develop/providers.html#implicit-provider-inheritance
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).
#
data "http" "releases" {
  url = "https://api.github.com/repos/kube-vip/kube-vip/releases"
}

locals {
  cpem_installed = try(var.kube_vip_config.cpem_installed, true)
  kvversion      = coalesce(try(var.kube_vip_config.version, ""), jsondecode(data.http.releases.response_body).0.name)
}

resource "kubectl_manifest" "kube_vip" {
  sensitive_fields = [
    "spec.template.spec.containers"
  ]
  yaml_body = templatefile("${path.module}/templates/manifest.tftpl", {
    cpem_enabled  = local.cpem_installed
    kvversion     = local.kvversion
    metal_project = local.cpem_installed ? "" : var.addon_context.equinix_project
    metal_key     = local.cpem_installed ? "" : var.kube_vip_config.metal_key
  })
  force_new = true
}
