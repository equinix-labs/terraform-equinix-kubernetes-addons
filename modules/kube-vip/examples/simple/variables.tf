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
  description = "Equinix Metal API key. Required only if cpem_installed is `false`"
  sensitive   = true
}

variable "metal_project_id" {
  description = "Equinix Metal project ID. Required only if cpem_installed is `false`"
  type        = string
}

variable "cpem_installed" {
  description = <<EOT
set `false` if cloud-provider-equinix-metal addon is NOT being enabled in the equinix_kubernetes_addons
module or CPEM is NOT already running on the kubernetes cluster
EOT
  type        = bool
  default     = false
}

variable "kubeconfig_local_path" {
  type        = string
  description = <<EOT
Local path to your kubeconfig file. Checkout https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs
for other auth/configuration options
EOT
}
