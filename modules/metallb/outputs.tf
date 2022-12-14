output "ip_address_pools" {
  description = "blocks IP addresses of created ipaddresspool.metallb.io resources"
  value = local.ip_address_pools
}
