module "terraform-equinix-kubernetes-addons" {
  source = "../../../../"

  equinix_project = var.metal_project_id
  equinix_metro   = "LD"

  ssh_host        = var.host
  ssh_user        = var.user
  ssh_private_key = file(var.private_key_path)

  kubeconfig_remote_path = var.kubeconfig_remote_path
  kubeconfig_local_path  = var.kubeconfig_local_path

  enable_longhorn = true

}
