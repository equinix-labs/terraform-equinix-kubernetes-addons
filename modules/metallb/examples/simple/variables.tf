variable "project" {
  description = "Equinix project"
  type        = string
}

variable "host" {
  type        = string
  description = "The address of the server from where to perform kubectl installations and changes"
}

variable "user" {
  type        = string
  description = "The username of the ssh key used to connect to the server defined in host"
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
