variable "ssh_config" {
  description = "Connection details to apply configuration"
  type = object({
    host        = string
    user        = optional(string)
    private_key = string
  })
}

variable "addon_context" {
  description = "Input context for the addon"
  type = object({
    equinix_project        = string
    equinix_metro          = string
    kubeconfig_remote_path = string
  })
}

variable "addon_config" {
  description = "Add-on configuration for Cloud Provider Equinix Metal"
  type = object({
    version = string
    secret  = map(string)
  })
  validation {
    condition     = contains(keys(var.addon_config.secret), "apiKey")
    error_message = "addon_config.secret must include an apiKey"
  }
  validation {
    condition     = contains(keys(var.addon_config.secret), "projectID")
    error_message = "addon_config.secret must include a projectID"
  }
}
