
# TEMPLATE: Consider the attributes users of this module will need to take advantage of this module
# TEMPLATE: in a new module that depends on this module (addresses, credentials, filenames).
# TEMPLATE: All outputs must have a description. Do not include descriptions or help text in the
# TEMPLATE: value, use the description field.
# TEMPLATE:
# TEMPLATE: Declare all outputs in this file, sprawling declarations are difficult to identify.
# TEMPLATE:
# TEMPLATE: https://www.terraform.io/docs/language/values/outputs.html
# TEMPLATE: https://www.terraform.io/docs/language/expressions/types.html
#
output "equinix_kubernetes_addons_{ADDON_NAME}" {
  description = "Map of attributes available for the {ADDON_NAME^} addon"
  value       = module.equinix_kubernetes_addons.{ADDON_NAME}
}
