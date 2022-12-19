terraform {
  required_version = ">= 1.0.0"

  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = ">= 1.11.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0"
    }
  }
}
