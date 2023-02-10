<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Simple Example

This example demonstrates usage of the Portworx_data_services addon module.

## Prerequisites

Ensure that you have installed the following tools on your machine.

1. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Usage

To provision this example, you should clone the github repository and run terraform from within this directory:

```
git clone https://github.com/equinix-labs/terraform-equinix-kubernetes-addons.git
cd terraform-equinix-kubernetes-addons/modules/portworx-data-services/examples/simple
terraform init
terraform apply
```

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_equinix_kubernetes_addons"></a> [equinix\_kubernetes\_addons](#module\_equinix\_kubernetes\_addons) | ../../../../ | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubeconfig_local_path"></a> [kubeconfig\_local\_path](#input\_kubeconfig\_local\_path) | Local path to the kubeconfig | `string` | n/a | yes |
| <a name="input_metal_auth_token"></a> [metal\_auth\_token](#input\_metal\_auth\_token) | Equinix Metal API key. Leave it empty to use your METAL\_AUTH\_TOKEN / TF\_VAR\_metal\_auth\_token environment variable | `string` | n/a | yes |
| <a name="input_pds_name"></a> [pds\_name](#input\_pds\_name) | Name of the PDS deployment target | `string` | n/a | yes |
| <a name="input_pds_tenant_id"></a> [pds\_tenant\_id](#input\_pds\_tenant\_id) | Tenant id of the PDS account | `string` | n/a | yes |
| <a name="input_pds_token"></a> [pds\_token](#input\_pds\_token) | API token from User's PDS profile page | `string` | n/a | yes |
| <a name="input_pds_account_id"></a> [pds\_account\_id](#input\_pds\_account\_id) | PDS Service Account ID used to create auth token for adding target cluster. Should be used by all users to consume the module | `string` | `"db4652ee-8937-47b2-952d-3b883fd2cb33"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_equinix_kubernetes_addons_portworx_data_services"></a> [equinix\_kubernetes\_addons\_portworx\_data\_services](#output\_equinix\_kubernetes\_addons\_portworx\_data\_services) | Map of attributes available for the Portworx\_data\_services addon |
<!-- END_TF_DOCS -->
