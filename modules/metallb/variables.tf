
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
  description = "Add-on configuration for Metallb"
  type        = any
  ## TODO(ocobleseqx): should we define all options here?
  # type = object({
  #   lb_services_name = list(string)
  #   lb_bgp_customer_asn = number
  # })
  default = {}
}

variable "test" {
  description = "test gh"
  type        = any
  default     = {}
}

variable "test2" {
  description = "test gh"
  type        = any
  default     = {}
}
