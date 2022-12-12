
variable ssh_config {
  description = "Connection details to apply configuration"
  type = object({
    host = string
    private_key = string
  })
}

variable addon_context {
  description = "Input context for the addon"
  type = object({
    equinix_project = string
    equinix_metro = string
  })
}

variable addon_config {
  description = "Add-on configuration for Metallb"
  type        = any
  //TODO should we define all options here? 
  # type = object({
  #   lb_services_name = list(string)
  #   lb_bgp_customer_asn = number
  # })
  default = {}
}
