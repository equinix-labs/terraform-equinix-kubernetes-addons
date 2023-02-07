# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE: Consider the attributes users of this module will need to take advantage of this module
# TEMPLATE: in a new module that depends on this module (addresses, credentials, filenames).
# TEMPLATE: All outputs must have a description. Do not include descriptions or help text in the
# TEMPLATE: value, use the description field.
# TEMPLATE:
# TEMPLATE: Declare all outputs in this file, sprawling declarations are difficult to identify.
# TEMPLATE:
# TEMPLATE: https://www.terraform.io/docs/language/values/outputs.html
# TEMPLATE: https://www.terraform.io/docs/language/expressions/types.html
# TEMPLATE:

# TEMPLATE: Replace sample output described below with your own.

output "portworx-data-services" {
  value       = data.external.get_cluster_id.result
  description = "Portworx data services info"
}
