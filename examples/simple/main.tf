module "terraform-equinix-kubernetes-addons" {
  source = "../../"

  equinix_project = var.project
  equinix_metro   = "LD"

  host        = var.host
  private_key = var.private_key

  enable_metallb = true
  metallb_config = {

    address_pools = [
      {
        "name" = "sandbox",
        "request" = {
          "quantity" = 1  #The number of allocated /32 addresses, power of 2, up to 256
          //TODO "familiy" = ipv4
          //TODO "type" = public/global
        }
        # "addresses" = ["192.168.10.0/24", "192.168.9.1-192.168.9.", "fc00:f853:0ccd:e799::/124"]
      },
      {
        "name" = "production",
        "request" = {
          "quantity" = 4
        }
      }
    ]

    # bgp_peer = {
    #   peer_asn = 65530 #by default 65530. Private Equinix Metal ToR
    #   my_asn = 65000 #by default 65000. Private Equinix Metal Server. Working with Calico may require change the asn https://github.com/equinix-labs/terraform-metal-kubernetes-bgp/blob/main/images/network-arch.png
    #   //TODO if FRR mode supported let define bdf_profile
    # }

    //TODO
    # bgp_advertisement = {
    #   node_selector_hostnames = ["node1", "controller1"] #Announcing the Service from a subset of nodes
    # }
  }

}
