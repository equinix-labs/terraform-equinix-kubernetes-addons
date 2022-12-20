module "metallb" {
  count  = var.enable_metallb ? 1 : 0
  source = "./modules/metallb"

  ssh_config    = local.ssh_config
  addon_config  = var.metallb_config
  addon_context = local.addon_context
}
module "longhorn" {
  count           = var.enable_longhorn ? 1 : 0
  source          = "./modules/longhorn"
  longhorn_config = var.longhorn_config
}
