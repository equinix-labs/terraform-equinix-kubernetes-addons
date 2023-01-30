output "portworx_uuid" {
  value       = data.external.get_px_data.result.cluster_id
  description = "Portworx cluster uuid"
}

output "portworx_name" {
  value       = data.external.get_px_data.result.cluster_name
  description = "Portworx cluster name"
}
