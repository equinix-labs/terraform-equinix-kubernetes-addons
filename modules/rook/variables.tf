# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
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

variable "addon_config" {
  description = "Add-on configuration for Longhorn"
  type        = any
  //TODO should we define all options here? 
  # type = object({
  #   lb_services_name = list(string)
  #   lb_bgp_customer_asn = number
  # })
  default = {}
}
