locals {

    ssh_config = {
        host = var.host
        private_key = var.private_key
    }

    addon_context = {
        equinix_metro          = var.equinix_metro
        equinix_project        = var.equinix_project
        tags                   = var.tags
        kubeconfig_remote_path = var.kubeconfig_remote_path
    }
}
