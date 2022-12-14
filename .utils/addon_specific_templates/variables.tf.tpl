# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE:
# TEMPLATE: All variables must have a description and should declare their type.
# TEMPLATE: Set defaults whenever possible but do not set defaults for required properties.
# TEMPLATE: Declare all variables in this file, sprawling declarations are difficult to identify.
# TEMPLATE:
# TEMPLATE: https://www.terraform.io/docs/language/values/variables.html
# TEMPLATE: https://www.terraform.io/docs/language/expressions/types.html
#
variable "ssh_config" {
  description = "Connection details to apply configuration"
  type = object({
    host        = string
    user        = optional(string)
    private_key = string
  })
}

variable "addon_context" {
  description = "Input context for the addon"
  type = object({
    equinix_project        = string
    equinix_metro          = string
    kubeconfig_remote_path = string
  })
}

variable "{ADDON_NAME}_config" {
  description = "Add-on configuration for {ADDON_NAME^}"
  type        = any
  default     = {}
}
