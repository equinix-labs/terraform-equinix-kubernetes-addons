output "services" {
  value = [for svc in local.services : {
    svc =  equinix_metal_reserved_ip_block.load_balancer_ips[svc].cidr_notation
  }]
}


