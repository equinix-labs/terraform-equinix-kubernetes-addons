locals {
    module_context = {
        k8s_cluster_endpoint = var.cluster_endpoint
        equinix_metro   = var.metro
        equinix_project = var.project
        tags = var.tags
    } 
}