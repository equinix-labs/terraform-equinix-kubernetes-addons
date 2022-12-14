locals {

  ssh_config = {
    host        = var.ssh_host
    user        = var.ssh_user
    private_key = var.ssh_private_key
  }

  addon_context = {
    equinix_metro          = var.equinix_metro
    equinix_project        = var.equinix_project
    tags                   = var.tags
    kubeconfig_remote_path = var.kubeconfig_remote_path
  }
}
