<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Simple Example

This example demonstrates usage of the Cloud Provider Equinix Metal addon module.

## Prerequisites

Ensure that you have installed the following tools on your machine.

1. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Usage

To provision this example, you should clone the github repository and run terraform from within this directory:

```
git clone https://github.com/equinix-labs/terraform-equinix-kubernetes-addons.git
cd terraform-equinix-kubernetes-addons/modules/cloudproviderequinixmetal/examples/simple
terraform init
terraform apply
```

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_equinix_kubernetes_addons"></a> [terraform\_equinix\_kubernetes\_addons](#module\_terraform\_equinix\_kubernetes\_addons) | ../../../../ | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metal_auth_token"></a> [metal\_auth\_token](#input\_metal\_auth\_token) | Equinix Metal API key to be used by Cloud Provider Equinix Metal | `string` | n/a | yes |
| <a name="input_metal_project_id"></a> [metal\_project\_id](#input\_metal\_project\_id) | Equinix project ID to be used by Cloud Provider Equinix Metal | `string` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Path to an SSH key to use for the connection | `string` | n/a | yes |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | The address of the server from where to perform kubectl installations and changes | `string` | n/a | yes |
| <a name="input_kubeconfig_remote_path"></a> [kubeconfig\_remote\_path](#input\_kubeconfig\_remote\_path) | Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server | `string` | `""` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | The user to use for the connection | `string` | `"root"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_provider_equinix_metal"></a> [cloud\_provider\_equinix\_metal](#output\_cloud\_provider\_equinix\_metal) | Equinix kubernetes addons - Cloud Provider Equinix Metal prerequisites |
<!-- END_TF_DOCS -->
