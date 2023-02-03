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
  description = "Portworx add-on outputs"
}

output "portworx_data_services" {
    value = module.portworx_data_services
    description = "Map of attributes available for the Portworx_data_services addon"
}
