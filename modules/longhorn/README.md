## Longhorn

Longhorn is a lightweight, reliable and easy-to-use distributed block storage system for Kubernetes.

For more details checkout [Longhorn](https://longhorn.io/docs/) docs.

<!-- TEMPLATE: Insert an image here of the infrastructure diagram. You can generate a starting image using instructions found at https://www.terraform.io/docs/cli/commands/graph.html#generating-images -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.longhorn](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_config"></a> [addon\_config](#input\_addon\_config) | Add-on configuration for Longhorn | `any` | `{}` | no |
| <a name="input_addon_context"></a> [addon\_context](#input\_addon\_context) | Input context for the addon | <pre>object({<br>    equinix_project        = string<br>    equinix_metro          = string<br>    kubeconfig_remote_path = string<br>  })</pre> | n/a | yes |
| <a name="input_ssh_config"></a> [ssh\_config](#input\_ssh\_config) | Connection details to apply configuration | <pre>object({<br>    host        = string<br>    user        = optional(string)<br>    private_key = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->