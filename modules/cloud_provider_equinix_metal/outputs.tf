output "prerequisites" {
  description = "cloud-init configuration that must be run on nodes when they are provisioned.  Must be a list of objects conforming to the `part` schema documented for the `cloudinit_config` resource: https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/cloudinit_config"
  value       = data.cloudinit_config.prerequisites.part
}
