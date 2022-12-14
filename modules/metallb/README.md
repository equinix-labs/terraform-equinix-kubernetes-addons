## Metallb

<!-- TEMPLATE: Review all "TEMPLATE" comments and remove them when applied. -->
<!-- TEMPLATE: replace "template" with the name of your project. The prefix "terraform-equinix-" informs the Terraform registry that this project is a Terraform module associated with the Equinix provider, Oreserve this prefix.  "terraform-metal-" may also be used for Equinix Metal modules, but "terraform-equinix-" will work too. -->
[![Experimental](https://img.shields.io/badge/Stability-Experimental-red.svg)](https://github.com/equinix-labs/standards#about-uniform-standards)
[![terraform](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml/badge.svg)](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml)

MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols.

For more details checkout [MetalLB](https://metallb.universe.tf/) docs.

<!-- TEMPLATE: Insert an image here of the infrastructure diagram. You can generate a starting image using instructions found at https://www.terraform.io/docs/cli/commands/graph.html#generating-images -->

// TODO generate modules documentation https://terraform-docs.io/developer-guide/plugins/


## Example

```
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
        "name" = "sandbox"
        "request" = {
          "quantity" = 1  #by default 1. The number of allocated /32 addresses, power of 2, up to 256
          //TODO "familiy" = ipv4
          //TODO "type" = public/global
        }
        # "addresses" = ["192.168.10.0/24", "192.168.9.1-192.168.9.", "fc00:f853:0ccd:e799::/124"]
      },
      {
        "name" = "production",
        "addresses" = {
          "quantity" = 4
        }
        "addresses" = []
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
```