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

variable "metal_project_id" {
  description = "Equinix Metal project ID"
  type        = string
}

variable "host" {
  type        = string
  description = "The address of the server from where to perform kubectl installations and changes"
}

variable "private_key_path" {
  type        = string
  description = "Path to an SSH key to use for the connection"
}

variable "kubeconfig_remote_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server"
  default     = ""
}
