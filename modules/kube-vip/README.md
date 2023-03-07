<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Kube-vip

<!-- TEMPLATE: Insert a short description here. -->

Kube-vip is an open-source project that aims to simplify providing load balancing services for Kubernetes clusters.
For more details checkout [Kube-vip](https://kube-vip.io/) docs.

**NOTE:** Current addons version is only for [running type:LoadBalancer services on worker nodes](https://kube-vip.io/docs/usage/equinix/#load-balancing-services-on-equinix-metal),
and will create a daemonset that will run kube-vip. Kube-vip for [HA Clusters in Equinix Metal](https://kube-vip.io/docs/usage/equinix/#creating-ha-clusters-in-equinix-metal)
is not yet supported here.

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >=3.1.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | >=3.1.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >= 1.7.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [kubectl_manifest.kube_vip](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [http_http.releases](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_context"></a> [addon\_context](#input\_addon\_context) | Input context for the addon | <pre>object({<br>    equinix_project       = string<br>    kubeconfig_local_path = string<br>  })</pre> | n/a | yes |
| <a name="input_kube_vip_config"></a> [kube\_vip\_config](#input\_kube\_vip\_config) | Add-on configuration for Kube-vip | `any` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_daemonset_name"></a> [daemonset\_name](#output\_daemonset\_name) | kube-vip daemonset name |
| <a name="output_daemonset_namespace"></a> [daemonset\_namespace](#output\_daemonset\_namespace) | kube-vip daemonset namespace |
<!-- END_TF_DOCS -->
