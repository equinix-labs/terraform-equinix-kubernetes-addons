data "http" "get_token" {
  url = "https://prod.pds.portworx.com/api/service-accounts/${var.portworx_data_services_config.pds_account_id}/token"       #${local.extd.cluster-id}
  request_headers = {
    Accept = "application/json"
    Authorization = "Bearer ${var.portworx_data_services_config.pds_token}"
  }
}

data "http" "get_version" {
  url = "https://prod.pds.portworx.com/api/metadata"
  request_headers = {
    Accept = "application/json"
    Authorization = "Bearer ${var.portworx_data_services_config.pds_token}"
  }
}

data "external" "get_cluster_id" {
  program = ["sh", "-c", "/usr/local/bin/kubectl --kubeconfig ${var.addon_context.kubeconfig_local_path} get namespace kube-system -o jsonpath='{\"{\"}\"cluster-id\": \"{.metadata.uid}\"}'"]
}

locals {
auth_token = jsondecode("${data.http.get_token.response_body}").token
helm_version = jsondecode("${data.http.get_version.response_body}").helm_chart_version
extd = data.external.get_cluster_id.result
}

resource "kubernetes_namespace" "pds-ns" {
  metadata {
    labels = {
      "pds.portworx.com/available" = "true"
    }

    name = "pds-ns"
  }
}

resource "null_resource" "px_check" {
  provisioner "local-exec" {
    when    = create
    command = "kubectl --kubeconfig ${var.addon_context.kubeconfig_local_path} wait --for=jsonpath='{.status.phase}'=Online storagecluster px-cluster -n portworx --timeout=300s"
  }
}

resource "helm_release" "pds-install" {
  depends_on       = [ null_resource.px_check, null_resource.pds_remove, kubernetes_namespace.pds-ns ]
  name             = "pds"
  repository       = "https://portworx.github.io/pds-charts"
  chart            = "pds-target"
  namespace        = "pds-system"
  create_namespace = true
  version          = local.helm_version
  set {
    name  = "tenantId"
    value = var.portworx_data_services_config.pds_tenant_id
  }
  set {
    name  = "clusterName"
    value = var.portworx_data_services_config.pds_name
  }
  set {
    name  = "bearerToken"
    value = local.auth_token
  }
  set {
    name  = "apiEndpoint"
    value = "https://prod.pds.portworx.com/api"
  }

}

resource "null_resource" "pds_remove" {
  depends_on = [ null_resource.px_check ]
  triggers = {
      deploy_id = local.extd.cluster-id
      local_kube = var.addon_context.kubeconfig_local_path
      tenant_id = var.portworx_data_services_config.pds_tenant_id
      token_id = var.portworx_data_services_config.pds_token
    }
  provisioner "local-exec" {
    when    = destroy
    command = <<-EOT
       echo "Waiting for uninstall to finish"
       sleep 180
       bash ${path.module}/scripts/rm-pds-entry.sh ${self.triggers.token_id} ${self.triggers.tenant_id} ${self.triggers.deploy_id}
    EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.root
  }

}
