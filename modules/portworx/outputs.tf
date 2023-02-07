output "portworx" {
  value       = data.external.get_px_data.result
  description = "Portworx cluster info"
}
