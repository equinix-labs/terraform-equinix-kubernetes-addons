module "terraform-equinix-kubernetes-addons" {
  source = "../../"

  project = var.project
  metro   = local.metro

  cluster_endpoint = var.cluster_endpoint

  enable_metallb = true

  tags = local.tags
}

locals {
  metro = "LD"

  tags = {
    Template = "simple"
  }
}