locals {
  metallb_version = "v0.13.7"
  metallb_install_url = "https://raw.githubusercontent.com/metallb/metallb/${local.metallb_version}/config/manifests/metallb-native.yaml"

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

  kubeconfig = try(var.addon_context.kubeconfig_remote_path, "") == null ? "" : var.addon_context.kubeconfig_remote_path
  kubectl    = local.kubeconfig != "" ? format("kubectl --kubeconfig %s", local.kubeconfig) : "kubectl"
}

resource "null_resource" "setup_metallb" {

  triggers = {
    kubectl             = local.kubectl
    metallb_install_url = local.metallb_install_url
    host                = var.ssh_config.host
    user                = var.ssh_config.user
    private_key         = var.ssh_config.private_key
  }

  connection {
    type        = "ssh"
    user        = self.triggers.user
    host        = self.triggers.host
    private_key = self.triggers.private_key
  }

  provisioner "remote-exec" {
    inline = [
      format("%s apply -f %s", self.triggers.kubectl, self.triggers.metallb_install_url)
    ]
  }

  provisioner "remote-exec" {
    when       = destroy
    on_failure = continue

    inline = [
      format("%s delete -f %s", self.triggers.kubectl, self.triggers.metallb_install_url)
    ]
  }
}

resource "null_resource" "config_metallb" {
  depends_on = [ null_resource.setup_metallb ]

  triggers = {
    kubectl     = local.kubectl
    host        = var.ssh_config.host
    user        = var.ssh_config.user
    private_key = var.ssh_config.private_key
  }

  connection {
    type        = "ssh"
    user        = self.triggers.user
    host        = self.triggers.host
    private_key = self.triggers.private_key
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
      format("%s apply -f /tmp/metallb-config.yaml", self.triggers.kubectl)
    ]
  }

  provisioner "remote-exec" {
    when       = destroy
    on_failure = continue
    inline = [
      format("%s delete -f /tmp/metallb-config.yaml", self.triggers.kubectl)
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
