variable enable_metallb {
  description = "Enable Metallb add-on"
  type        = bool
  default     = false
}

variable metallb_config {
  description = "Configuration for Metallb add-on"
  type        = any
  default     = {}
}

variable host {
    type = string
    description = "The address of the server from where to perform kubectl installations and changes"
}

variable private_key {
    type = string
    description = "The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function"
}

variable kubeconfig_remote_path {
    type = string
    description = "Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server"
}

variable tags {
  description = "Additional tags (e.g. `['k8s`,`production`]"
  type        = list(string)
  default     = []
}

variable equinix_project {
  description = "Equinix project"
  type        = string
}

variable equinix_metro {
  description = "Equinix metro code"
  type        = string
}
