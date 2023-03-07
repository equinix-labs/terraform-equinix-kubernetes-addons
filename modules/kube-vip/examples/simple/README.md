<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Simple Example

This example demonstrates usage of the Kube-vip addon module. In this example it is assumed
[cloud-provider-equinix-metal](https://github.com/equinix/cloud-provider-equinix-metal)(CPEM) is not running in your cluster.
Therefore, the module requires the field `equinix_project` and the `kube_vip_config` block with the `cpem_installed` field set to `false`
and your `metal_key`. For installations where CPEM is running or being enabled, these field can be omitted at all as in the example below.

- Example module configuration when CPEM is already running in the cluster

```
provider "kubectl" {
  config_path = var.kubeconfig_local_path
}

module "equinix_kubernetes_addons" {
  source = "../../../../"
  enable_kube_vip = true
}
```

## Prerequisites

Ensure that you have installed the following tools on your machine.

1. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Usage

To provision this example, you should clone the github repository and run terraform from within this directory:

```
git clone https://github.com/equinix-labs/terraform-equinix-kubernetes-addons.git
cd terraform-equinix-kubernetes-addons/modules/kube-vip/examples/simple
terraform init
terraform apply
```

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >=3.1.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |

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
| <a name="input_kubeconfig_local_path"></a> [kubeconfig\_local\_path](#input\_kubeconfig\_local\_path) | Local path to your kubeconfig file. Checkout https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs<br>for other auth/configuration options | `string` | n/a | yes |
| <a name="input_metal_auth_token"></a> [metal\_auth\_token](#input\_metal\_auth\_token) | Equinix Metal API key. Required only if cpem\_installed is `false` | `string` | n/a | yes |
| <a name="input_metal_project_id"></a> [metal\_project\_id](#input\_metal\_project\_id) | Equinix Metal project ID. Required only if cpem\_installed is `false` | `string` | n/a | yes |
| <a name="input_cpem_installed"></a> [cpem\_installed](#input\_cpem\_installed) | set `false` if cloud-provider-equinix-metal addon is NOT being enabled in the equinix\_kubernetes\_addons<br>module or CPEM is NOT already running on the kubernetes cluster | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_equinix_kubernetes_addons_kube_vip"></a> [equinix\_kubernetes\_addons\_kube\_vip](#output\_equinix\_kubernetes\_addons\_kube\_vip) | Map of attributes available for the Kube-vip addon |
<!-- END_TF_DOCS -->
