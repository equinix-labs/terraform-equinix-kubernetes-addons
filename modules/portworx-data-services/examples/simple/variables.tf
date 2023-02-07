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
variable "pds_account_id" {
  type        = string
  description = "Account ID used to create token for API calls"
}

variable "pds_token" {
  type        = string
  description = "API token from User's PDS profile page"
}

variable "tenant_id" {
  type        = string
  description = "Tenant id of the PDS account"
}

variable "pds_name" {
  type        = string
  description = "Name of the PDS deployment target"
}


variable "kubeconfig_local_path" {
  type        = string
  description = "Local path to the kubeconfig"
}
