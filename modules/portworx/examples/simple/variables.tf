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
variable "metal_auth_token" {
  type        = string
  description = "Equinix Metal API key. Leave it empty to use your METAL_AUTH_TOKEN / TF_VAR_metal_auth_token environment variable"
  sensitive   = true
}

variable "node_names" {
  type        = list(string)
  description = "Baremetal hostnames"
  default     = null
}

variable "private_key_path" {
  type        = string
  description = "Path to an SSH key to use for the connection"
  default     = null
}

variable "node_ips" {
  type        = list(string)
  description = "Baremetal ipv4 addresses"
  default     = null
}

variable "node_user" {
  type        = list(string)
  description = "Baremetal username to login"
  default     = null
}

variable "kubeconfig_local_path" {
  type        = string
  description = "Local path to the kubeconfig"
  default     = null
}
