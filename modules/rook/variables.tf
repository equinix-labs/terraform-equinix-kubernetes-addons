# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE: All variables must have a description and should declare their type.
# TEMPLATE: Set defaults whenever possible but do not set defaults for required properties.
# TEMPLATE: Declare all variables in this file, sprawling declarations are difficult to identify.
# TEMPLATE:
# TEMPLATE: https://www.terraform.io/docs/language/values/variables.html
# TEMPLATE: https://www.terraform.io/docs/language/expressions/types.html
#
variable "rook_config" {
  description = "Add-on configuration for Rook add-on"
  type        = any
  default = {
    rook_ceph_name              = "rook-ceph"
    rook_ceph_namespace         = "rook-ceph"
    rook_ceph_cluster_name      = "rook-ceph-cluster"
    rook_ceph_cluster_namespace = "rook-ceph"
  }
}
