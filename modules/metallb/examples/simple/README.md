## Simple Example

This example demonstrates usage of the Metallb addon module.

## Usage

```
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
| <a name="input_host"></a> [host](#input\_host) | The address of the server from where to perform kubectl installations and changes | `string` | n/a | yes |
| <a name="input_metal_auth_token"></a> [metal\_auth\_token](#input\_metal\_auth\_token) | Equinix Metal API key. Leave it empty to use your METAL\_AUTH\_TOKEN / TF\_VAR\_metal\_auth\_token environment variable | `string` | n/a | yes |
| <a name="input_metal_project_id"></a> [metal\_project\_id](#input\_metal\_project\_id) | Equinix Metal project ID | `string` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Path to an SSH key to use for the connection | `string` | n/a | yes |
| <a name="input_kubeconfig_remote_path"></a> [kubeconfig\_remote\_path](#input\_kubeconfig\_remote\_path) | Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server | `string` | `""` | no |
| <a name="input_user"></a> [user](#input\_user) | The username of the ssh key used to connect to the server defined in host | `string` | `"root"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_equinix_kubernetes_addons"></a> [terraform\_equinix\_kubernetes\_addons](#output\_terraform\_equinix\_kubernetes\_addons) | Equinix kubernetes addons - MetaLB outputs |
<!-- END_TF_DOCS -->
