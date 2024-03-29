provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_local_path
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_local_path
}

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

module "rook" {
  count  = var.enable_rook ? 1 : 0
  source = "./modules/rook"

  rook_config = var.rook_config
}

module "cloud_provider_equinix_metal" {
  count  = var.enable_cloud_provider_equinix_metal ? 1 : 0
  source = "./modules/cloud_provider_equinix_metal"

  ssh_config    = local.ssh_config
  addon_config  = var.cloud_provider_equinix_metal_config
  addon_context = local.addon_context
}

module "portworx" {
  count  = var.enable_portworx ? 1 : 0
  source = "./modules/portworx"

  addon_context   = local.addon_context
  portworx_config = var.portworx_config
}

module "portworx_data_services" {
  depends_on = [module.portworx]
  count      = var.enable_portworx_data_services ? 1 : 0
  source     = "./modules/portworx-data-services"

  addon_context                 = local.addon_context
  portworx_data_services_config = var.portworx_data_services_config
}

module "kube_vip" {
  depends_on = [module.cloud_provider_equinix_metal]
  count      = var.enable_kube_vip ? 1 : 0
  source     = "./modules/kube-vip"

  addon_context   = local.addon_context
  kube_vip_config = var.kube_vip_config
}
