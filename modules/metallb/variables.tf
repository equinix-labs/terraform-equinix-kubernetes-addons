variable "module_context" {
  description = "Input configuration for the addon"
  type = object({
    k8s_cluster_endpoint = string
    equinix_metro        = string
    equinix_project      = string
    tags                 = map(string)
  })
}

