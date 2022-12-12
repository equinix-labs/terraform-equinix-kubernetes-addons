module "terraform-equinix-kubernetes-addons" {
  source = "../../"

  equinix_project = var.project
  equinix_metro   = "LD"

  host        = var.host
  private_key = var.private_key

  enable_metallb = true
  metallb_config = {
    services = ["my-app"]
    bgp_customer_asn = 62345
  }
}
