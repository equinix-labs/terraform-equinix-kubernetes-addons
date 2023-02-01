variable "addon_context" {
  description = "Input context for the addon"
  type = object({
    kubeconfig_local_path = string
  })
}

variable "portworx_config" {
  type        = any
  description = "Configuration for Portworx add-on"
  default     = {}
}
