resource "helm_release" "longhorn" {
  name             = var.longhorn_config.longhorn_name
  namespace        = var.longhorn_config.longhorn_namespace
  create_namespace = true
  repository       = "https://charts.longhorn.io"
  chart            = "longhorn"

  /*  #Set overrides here  
   set {
  defaultSettings.taintToleration  = "key1=value1:NoSchedule; key2:NoExecute"
  } */
}
