# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE: Before using "provider" blocks, consider https://www.terraform.io/docs/language/modules/develop/providers.html#implicit-provider-inheritance
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).

# TEMPLATE: Replace sample provider described below with your own.
terraform {
  required_version = ">= 1.3"

  provider_meta "equinix" {
    # TEMPLATE: Replace the module name with your own.
    module_name = "inline-module"
  }

  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = ">= 1.8.0"
    }
  }
}

# TEMPLATE: Replace sample resource described below with your own.
resource "equinix_metal_vlan" "inline_module_vlan" {
  description = "VLAN in SV"
  metro       = "sv"
  project_id  = var.inline_module_project_id
}

# TEMPLATE: Replace sample resource described below with your own.
resource "equinix_metal_gateway" "inline_module_gateway" {
  project_id               = var.inline_module_project_id
  vlan_id                  = equinix_metal_vlan.inline_module_vlan.id
  private_ipv4_subnet_size = 8
}