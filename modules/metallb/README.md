## Metallb

MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols.

For more details checkout [MetalLB](https://metallb.universe.tf/) docs.

<!-- TEMPLATE: Insert an image here of the infrastructure diagram. You can generate a starting image using instructions found at https://www.terraform.io/docs/cli/commands/graph.html#generating-images -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_equinix"></a> [equinix](#provider\_equinix) | >= 1.11.1 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [equinix_metal_reserved_ip_block.load_balancer_ips](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_reserved_ip_block) | resource |
| [null_resource.config_metallb](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.setup_metallb](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_config"></a> [addon\_config](#input\_addon\_config) | Add-on configuration for Metallb | `any` | `{}` | no |
| <a name="input_addon_context"></a> [addon\_context](#input\_addon\_context) | Input context for the addon | <pre>object({<br>    equinix_project        = string<br>    equinix_metro          = string<br>    kubeconfig_remote_path = string<br>  })</pre> | n/a | yes |
| <a name="input_ssh_config"></a> [ssh\_config](#input\_ssh\_config) | Connection details to apply configuration | <pre>object({<br>    host        = string<br>    user        = optional(string)<br>    private_key = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_address_pools"></a> [ip\_address\_pools](#output\_ip\_address\_pools) | n/a |
<!-- END_TF_DOCS -->
