locals {
  metallb_version = "v0.13.7"

  equinix_metal_side_asn = 65000
  customer_side_asn      = try(var.addon_config.bgp_customer_asn, 65432)
  services               =  try(toset(var.addon_config.services), [])
}

resource "null_resource" "setup_metallb" {
  connection {
    type        = "ssh"
    user        = "root"
    host        = var.ssh_config.host
    private_key = var.ssh_config.private_key
  }

  provisioner "file" {
    content     = templatefile("${path.module}/templates/config.yaml.tftpl", { 
      customer_side_asn      = local.customer_side_asn
      equinix_metal_side_asn = local.equinix_metal_side_asn
      load_balancer_cidrs    = [for svc in local.services : equinix_metal_reserved_ip_block.load_balancer_ips[svc].cidr_notation]
    })
    destination = "/tmp/metallb-config.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${local.metallb_version}/config/manifests/metallb-native.yaml",
      "kubectl apply -f /tmp/metallb-config.yaml",
    ]
  }
}

resource "equinix_metal_reserved_ip_block" "load_balancer_ips" {
  for_each = local.services

  project_id  = var.addon_context.equinix_project
  metro       = var.addon_context.equinix_metro
  quantity    = 1
  tags        = [each.key]
}
