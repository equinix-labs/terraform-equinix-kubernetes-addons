resource "helm_release" "longhorn" {
  name             = "longhorn"
  namespace        = "longhorn-system"
  create_namespace = true
  repository       = "https://charts.longhorn.io"
  chart            = "longhorn"

  /*  #Set overrides here  
   set {
  defaultSettings.taintToleration  = "key1=value1:NoSchedule; key2:NoExecute"
  } */
}
