## Simple Example

This example demonstrates usage of the Metallb addon module.

## Usage

```
terraform init
terraform apply
```
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
| <a name="module_terraform_equinix_kubernetes_addons"></a> [terraform\_equinix\_kubernetes\_addons](#module\_terraform\_equinix\_kubernetes\_addons) | ../../../../ | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | Equinix Metal API key | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | The address of the server from where to perform kubectl installations and changes | `string` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Path to an SSH key to use for the connection | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Equinix Metal project | `string` | n/a | yes |
| <a name="input_kubeconfig_remote_path"></a> [kubeconfig\_remote\_path](#input\_kubeconfig\_remote\_path) | Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server | `string` | `""` | no |
| <a name="input_test"></a> [test](#input\_test) | test gh | `any` | `{}` | no |
| <a name="input_test2"></a> [test2](#input\_test2) | test 2 gh | `any` | `{}` | no |
| <a name="input_test3"></a> [test3](#input\_test3) | test 3 gh | `any` | `{}` | no |
| <a name="input_user"></a> [user](#input\_user) | The username of the ssh key used to connect to the server defined in host | `string` | `"root"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_equinix_kubernetes_addons"></a> [terraform\_equinix\_kubernetes\_addons](#output\_terraform\_equinix\_kubernetes\_addons) | Equinix kubernetes addons - MetaLB outputs |
<!-- END_TF_DOCS -->
