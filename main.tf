module "metallb" {
  count  = var.enable_metallb ? 1 : 0
  source = "./modules/metallb"

  ssh_config    = local.ssh_config
  addon_config  = var.metallb_config
  addon_context = local.addon_context
}
module "rook" {
  count  = var.enable_rook ? 1 : 0
  source = "./modules/rook"

  ssh_config    = local.ssh_config
  addon_context = local.addon_context
}
