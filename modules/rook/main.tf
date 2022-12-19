# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE: Before using "provider" blocks, consider https://www.terraform.io/docs/language/modules/develop/providers.html#implicit-provider-inheritance
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).

resource "helm_release" "rook" {
  name             = "rook-ceph"
  namespace        = "rook-ceph"
  create_namespace = true
  repository       = "https://charts.rook.io/release"
  chart            = "rook-ceph"


  /*  #Set overrides here  
   set {
  defaultSettings.taintToleration  = "key1=value1:NoSchedule; key2:NoExecute"
  } */
}
