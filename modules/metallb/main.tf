locals {
  metallb_version = "v0.13.7"

  my_asn   = try(var.addon_config.bgp_peer.my_asn, 65000) #equinix_metal_server_asn
  peer_asn = try(var.addon_config.bgp_peer.peer_asn, 65530) #equinix_metal_tor_asn

  address_pools_set = try(toset(var.addon_config.address_pools), [])
  address_pools_requests_map = {for apr in local.address_pools_set : 
    apr.name => apr if try(apr.request, {}) != {}
  }
  address_pools_requested_map = {
    for name, apr in local.address_pools_requests_map : 
      name => { 
        "addresses" = [equinix_metal_reserved_ip_block.load_balancer_ips[name].cidr_notation]
      }
  }
  ip_address_pools = {
    for ap in local.address_pools_set : 
      ap.name => { 
        "addresses" = setunion(try(ap.addresses, []), try(local.address_pools_requested_map[ap.name].addresses, [])) 
      }
  }
}

resource "null_resource" "setup_metallb" {
  connection {
    type        = "ssh"
    user        = "root"
    host        = var.ssh_config.host
    private_key = var.ssh_config.private_key
  }

  provisioner "remote-exec" {
    inline = [
      "kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${local.metallb_version}/config/manifests/metallb-native.yaml",
    ]
  }
}

resource "null_resource" "config_metallb" {
  depends_on = [ null_resource.setup_metallb ]

  connection {
    type        = "ssh"
    user        = "root"
    host        = var.ssh_config.host
    private_key = var.ssh_config.private_key
  }

  provisioner "file" {
    content     = templatefile("${path.module}/templates/config.yaml.tftpl", { 
      peer_asn         = local.peer_asn
      my_asn           = local.my_asn
      ip_address_pools = local.ip_address_pools
    })
    destination = "/tmp/metallb-config.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "kubectl apply -f /tmp/metallb-config.yaml",
    ]
  }
}

resource "equinix_metal_reserved_ip_block" "load_balancer_ips" {
  for_each = local.address_pools_requests_map

  project_id = var.addon_context.equinix_project
  metro      = var.addon_context.equinix_metro
  quantity   = each.value.request.quantity
  tags       = [each.key]
}
