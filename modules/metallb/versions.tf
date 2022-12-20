terraform {
  required_version = ">= 1.0.0"

  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = ">= 1.11.1"
    }
  }

  provider_meta "equinix" {
    module_name = "equinix_kubernetes_addons metallb"
  }
}
