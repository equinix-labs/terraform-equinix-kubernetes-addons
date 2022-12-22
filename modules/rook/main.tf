# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE: Before using "provider" blocks, consider https://www.terraform.io/docs/language/modules/develop/providers.html#implicit-provider-inheritance
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).

resource "helm_release" "rook_ceph" {
  name             = var.rook_config.rook_ceph_name
  namespace        = var.rook_config.rook_ceph_namespace
  create_namespace = true
  repository       = "https://charts.rook.io/release"
  chart            = "rook-ceph"

}
resource "helm_release" "rook_ceph_cluster" {
  name             = var.rook_config.rook_ceph_cluster_name
  namespace        = var.rook_config.rook_ceph_cluster_namespace
  create_namespace = true
  repository       = "https://charts.rook.io/release"
  chart            = "rook-ceph-cluster"

  set {
    name  = "operatorNamespace"
    value = var.rook_config.rook_ceph_namespace
  }
}
