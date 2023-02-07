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

variable "worker_nodes" {
  type        = list(map(string))
  description = "List of Baremetal worker nodes"
}

variable "kubeconfig_local_path" {
  type        = string
  description = "Local path to the kubeconfig"
}
