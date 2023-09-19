<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Portworx_data_services

<!-- TEMPLATE: Insert a short description here. -->

For more details checkout [Portworx_data_services](https://pds.docs.portworx.com/) docs.

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >=2.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.8.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >=3.1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.17.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >=3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | >=2.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >=2.8.0 |
| <a name="provider_http"></a> [http](#provider\_http) | >=3.1.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >=2.17.0 |
| <a name="provider_null"></a> [null](#provider\_null) | >=3.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [helm_release.pds_install](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.pds_ns](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [null_resource.pds_remove](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.px_check](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [external_external.get_cluster_id](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [http_http.get_token](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.get_version](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_context"></a> [addon\_context](#input\_addon\_context) | Input context for the addon | <pre>object({<br>    kubeconfig_local_path = string<br>  })</pre> | n/a | yes |
| <a name="input_portworx_data_services_config"></a> [portworx\_data\_services\_config](#input\_portworx\_data\_services\_config) | Add-on configuration for Portworx\_data\_services | `any` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_portworx_data_services"></a> [portworx\_data\_services](#output\_portworx\_data\_services) | Portworx data services info |
<!-- END_TF_DOCS -->
