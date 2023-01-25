output "metallb" {
  description = "MetaLB addon outputs"
  value       = module.metallb
}

output "cloud_provider_equinix_metal" {
  description = "Cloud Provider Equinix Metal add-on outputs"
  value       = module.cloud_provider_equinix_metal
}

output "cloud_provider_equinix_metal_prerequisites" {
  description = "Cloud Provider Equinix Metal add-on prerequisites for device provisioning"
  value       = try(module.cloud_provider_equinix_metal[0].prerequisites, [])
}

output "portworx" {
  value       = module.portworx
  description = "Map of attributes available for the Portworx addon"
}
