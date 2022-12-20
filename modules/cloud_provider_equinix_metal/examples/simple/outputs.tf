output "cloud_provider_equinix_metal" {
  description = "Equinix kubernetes addons - Cloud Provider Equinix Metal outputs"
  value       = module.terraform_equinix_kubernetes_addons.cloud_provider_equinix_metal
}

output "cloud_provider_equinix_metal" {
  description = "Equinix kubernetes addons - Cloud Provider Equinix Metal prerequisites"
  value       = module.terraform_equinix_kubernetes_addons.cloud_provider_equinix_metal_prerequisites
}
