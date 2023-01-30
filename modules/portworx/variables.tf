variable "kubeconfig_local_path" {
  type        = string
  description = "Local path to the kubeconfig"
  default     = ""
}

variable "portworx_config" {
  type        = any
  description = "Configuration for Portworx add-on"
  default = {
    metal_auth_token    = null
    ssh_user            = "root"
    k8s_version         = "1.23"
    cp_node_count       = "1"
    cluster_name        = "px-cluster"
    kubespray_version   = "2.20"
    px_operator_version = "1.10.2"
    px_stg_version      = "2.12.1"
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
