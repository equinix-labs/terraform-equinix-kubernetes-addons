<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Portworx

<!-- TEMPLATE: Insert a short description here. -->

Portworx is a solution for persistent storage, disaster recovery, data security, cross-cloud and data migrations, and automated capacity management for Kubernetes apps.

For more details checkout [Portworx](https://docs.portworx.com/) docs.

### Prerequisites 
- Generic prerequisites - https://docs.portworx.com/install-portworx/prerequisites/
- Baremetal process - https://docs.portworx.com/install-portworx/kubernetes/bare-metal-kubernetes/
- KVDB - https://docs.portworx.com/concepts/internal-kvdb/

### Limitations
- Hardware: Current version for Equinix Metal only support cluster worker nodes with at least 2 dedicated storage disks, such as c3.medium.x86, m3-large, n3-xlarge or s3-xlarge. Checkout [server specifications](https://deploy.equinix.com/product/servers/) for more details.
- Operating System: Tested on CentOS 7, RHEL 8 , Ubuntu 20.04. There is a known issue preventing successful installation on Ubuntu 22.04+.

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >=2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >=3.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | >=2.0 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 2.0 |
| <a name="provider_null"></a> [null](#provider\_null) | >=3.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [local_sensitive_file.px_operator](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [local_sensitive_file.storage_cluster](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [local_sensitive_file.varsfile](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [null_resource.portworx_setup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.setup_disks](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [external_external.get_px_data](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_context"></a> [addon\_context](#input\_addon\_context) | Input context for the addon | <pre>object({<br>    kubeconfig_local_path = string<br>  })</pre> | n/a | yes |
| <a name="input_portworx_config"></a> [portworx\_config](#input\_portworx\_config) | Configuration for Portworx add-on | `any` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_portworx"></a> [portworx](#output\_portworx) | Portworx cluster info |
<!-- END_TF_DOCS -->
