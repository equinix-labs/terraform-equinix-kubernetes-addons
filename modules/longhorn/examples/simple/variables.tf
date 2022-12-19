variable "metal_auth_token" {
  type        = string
  description = "Equinix Metal API key"
  sensitive   = true
}

variable "metal_project_id" {
  description = "Equinix Metal project ID"
  type        = string
}

variable "kubeconfig_local_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file locally"
}

variable "host" {
  type        = string
  description = "The address of the server from where to perform kubectl installations and changes"
}

variable "user" {
  type        = string
  description = "The username of the ssh key used to connect to the server defined in host"
  default     = "root"
}

variable "private_key_path" {
  type        = string
  description = "Path to an SSH key to use for the connection"
}

variable "kubeconfig_remote_path" {
  type        = string
  description = "Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server"
  default     = ""
}

variable "longhorn_name" {
  type        = string
  description = "Release name helm uses for the longhorn chart"
  default     = "longhorn"
}

variable "longhorn_namespace" {
  type        = string
  description = "Namespace helm installs the longhorn chart into"
  default     = "longhorn-system"
}
