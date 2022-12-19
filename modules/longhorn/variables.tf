variable "addon_config" {
  description = "Add-on configuration for Metallb"
  type        = any
  //TODO should we define all options here? 
  # type = object({
  #   lb_services_name = list(string)
  #   lb_bgp_customer_asn = number
  # })
  default = {}
}
