# TEMPLATE: This file was automatically generated with `generate_addon_structure.sh`
# TEMPLATE: and should be modified as necessary
# TEMPLATE:
# TEMPLATE: All ".tf" files are parsed at once. There is no benefit to numerically prefixed filenames. Keep all resource definitions in "main.tf".
# TEMPLATE:
# TEMPLATE: When main.tf becomes unwieldy, consider submodules (https://www.terraform.io/docs/language/modules/develop/structure.html) 
# TEMPLATE: and dependency inversion (https://www.terraform.io/docs/language/modules/develop/composition.html).
#
provider "equinix" {
  auth_token = var.metal_auth_token
}

module "equinix_kubernetes_addons" {
  source = "../../../../"

  equinix_project = var.metal_project_id
  equinix_metro   = "SV"

  ssh_host        = var.host
  ssh_private_key = file(var.private_key_path)

  kubeconfig_remote_path = var.kubeconfig_remote_path

  enable_portworx = true

  portworx_config = {
    metal_auth_token    = null
    ssh_user            = "root"
    k8s_version         = "1.23"
    cp_node_count       = "1"
    cluster_name        = "px-cluster"
    kubespray_version   = "2.20"
    px_operator_version = "2.10.0"
    px_stg_version      = "1.10.1"
    px_security         = false
    ssh = {
      host             = ["host-01", "host-02", "host-03", "host-04"]
      worker_addresses = ["147.x.x.x", "147.x.x.x", "147.x.x.x", "145.x.x.x"]
      private_key      = "/root/.ssh/eqx_priv"
      user             = "root"
      kubeconfig       = "/root/kube-config-file"
    }
  }
}
