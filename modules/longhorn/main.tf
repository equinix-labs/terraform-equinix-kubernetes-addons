resource "helm_release" "longhorn" {
  name             = var.addon_config.longhorn_name
  namespace        = var.addon_config.longhorn_namespace
  create_namespace = true
  repository       = "https://charts.longhorn.io"
  chart            = "longhorn"

  /*  #Set overrides here  
   set {
  defaultSettings.taintToleration  = "key1=value1:NoSchedule; key2:NoExecute"
  } */
}
