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
}

variable "enable_rook" {
  type        = bool
  description = "Enable Rook add-on"
  default     = false
}

variable "rook_config" {
  type        = any
  description = "Configuration for Rook add-on"
}

variable "ssh_host" {
  type        = string
  description = "The address of the server from where to perform kubectl installations and changes"
}

variable "ssh_user" {
  type        = string
  description = "The user to use for the connection"
  default     = "root"
}

variable "ssh_private_key" {
  type        = string
  description = "The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function"
  sensitive   = true
}

variable "kubeconfig_remote_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server"
}
variable "kubeconfig_local_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file locally"
}

variable "tags" {
  type        = list(string)
  description = "Additional tags (e.g. `['k8s`,`production`]"
  default     = []
}

variable "equinix_project" {
  type        = string
  description = "Equinix project"
}

variable "equinix_metro" {
  type        = string
  description = "Equinix metro code"
}
