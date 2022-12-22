## Cloud Provider Equinix Metal

<!-- TEMPLATE: Review all "TEMPLATE" comments and remove them when applied. -->
<!-- TEMPLATE: replace "template" with the name of your project. The prefix "terraform-equinix-" informs the Terraform registry that this project is a Terraform module associated with the Equinix provider, Oreserve this prefix.  "terraform-metal-" may also be used for Equinix Metal modules, but "terraform-equinix-" will work too. -->

This is a Terraform module that installs and configures Cloud Provider Equinix Metal on a kubernetes cluster. For details about what Cloud Provider Equinix Metal is and how to configure it, refer to the [Cloud Provider Equinix Metal docs](https://github.com/equinix/cloud_provider_equinix_metal).

<!-- TEMPLATE: Insert an image here of the infrastructure diagram. You can generate a starting image using instructions found at https://www.terraform.io/docs/cli/commands/graph.html#generating-images -->

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | >= 2.2.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.1 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | >= 2.2.0 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3.1 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [null_resource.install_cloud_provider_equinix_metal](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [cloudinit_config.prerequisites](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_config"></a> [addon\_config](#input\_addon\_config) | Add-on configuration for Cloud Provider Equinix Metal | <pre>object({<br>    version = string<br>    secret  = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_addon_context"></a> [addon\_context](#input\_addon\_context) | Input context for the addon | <pre>object({<br>    equinix_project        = string<br>    equinix_metro          = string<br>    kubeconfig_remote_path = string<br>  })</pre> | n/a | yes |
| <a name="input_ssh_config"></a> [ssh\_config](#input\_ssh\_config) | Connection details to apply configuration | <pre>object({<br>    host        = string<br>    user        = optional(string)<br>    private_key = string<br>  })</pre> | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_prerequisites"></a> [prerequisites](#output\_prerequisites) | cloud-init configuration that must be run on nodes when they are provisioned.  Must be a list of objects conforming to the `part` schema documented for the `cloudinit_config` resource: https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/cloudinit_config |
<!-- END_TF_DOCS -->
