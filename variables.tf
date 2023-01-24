variable "enable_metallb" {
  type        = bool
  description = "Enable Metallb add-on"
  default     = false
}

variable "metallb_config" {
  type        = any
  description = "Configuration for Metallb add-on"
  default     = {}
}

variable "enable_longhorn" {
  type        = bool
  description = "Enable Longhorn add-on"
  default     = false
}
variable "longhorn_config" {
  type        = any
  description = "Configuration for Longhorn add-on"
  default     = null
}

variable "enable_rook" {
  type        = bool
  description = "Enable Rook add-on"
  default     = false
}

variable "rook_config" {
  type        = any
  description = "Configuration for Rook add-on"
  default     = null
}

variable "ssh_host" {
  type        = string
  description = "The address of the server from where to perform kubectl installations and changes"
  default     = null
}

variable "ssh_user" {
  type        = string
  description = "The user to use for the connection"
  default     = null
}

variable "ssh_private_key" {
  type        = string
  description = "The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function"
  sensitive   = true
  default     = null
}

variable "kubeconfig_remote_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server"
  default     = null
}
variable "kubeconfig_local_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file locally"
  default     = "/root/demo/terraform-portworx-on-baremetal/modules/k8s_setup/kube-config-file"
}

variable "tags" {
  type        = list(string)
  description = "Additional tags (e.g. `['k8s`,`production`]"
  default     = []
}

variable "equinix_project" {
  type        = string
  description = "Equinix project"
  default     = null
}

variable "equinix_metro" {
  type        = string
  description = "Equinix metro code"
  default     = null
}

variable "enable_cloud_provider_equinix_metal" {
  type        = bool
  description = "Enable cloudproviderequinixmetal add-on"
  default     = false
}

variable "cloud_provider_equinix_metal_config" {
  type        = any
  description = "Configuration for cloudproviderequinixmetal add-on"
  default     = {}
}

variable "enable_portworx" {
    type        = bool
    description = "Enable Portworx add-on"
    default     = true
}

#variable "portworx_config" {
#    type        = any
#    description = "Configuration for Portworx add-on"
#    default     = {}
#}

variable "portworx_config" {
  description = "Add-on configuration for Rook add-on"
  type        = any
  default = {
    metal_auth_token = null
    ssh_user = "root"
    k8s_version = "1.23"
    cp_node_count = "1"
    cluster_name = "px-cluster"
    kubespray_version = "2.20"
    px_operator_version = "2.10.0"
    px_stg_version = "1.10.1"
    px_security = false
    ssh = {
    host = ["soln-demo-01", "soln-demo-02", "soln-demo-03", "soln-demo-04"]
    worker_addresses = ["147.75.47.9", "147.75.35.95", "147.28.154.47", "145.40.99.5"]
    private_key      = "/root/.ssh/eqx_priv"
    user             = "root"
    kubeconfig       = "/root/demo/terraform-portworx-on-baremetal/modules/k8s_setup/kube-config-file"
  }
  }
}
