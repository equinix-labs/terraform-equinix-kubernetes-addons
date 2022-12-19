variable "longhorn_config" {
  description = "Add-on configuration for Longhorn add-on"
  type        = any
  default = {
    longhorn_name      = "longhorn"
    longhorn_namespace = "longhorn-system"
  }
}
