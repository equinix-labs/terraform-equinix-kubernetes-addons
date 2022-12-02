module "metallb" {
  count          = var.enable_metallb ? 1 : 0
  source         = "./modules/metallb"
  module_context = local.module_context
}