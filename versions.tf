terraform {
  required_version = ">= 1.0.0"
  provider_meta "equinix" {
    # Set the name of the module below
    module_name = "equinix-kubernetes-addons"
  }
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "~> 1.14"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0"
    }
    kubernetes = ">=2.17.0"
  }
}
