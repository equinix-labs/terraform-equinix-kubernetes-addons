## Rook

Rook is an open source cloud-native storage orchestrator, providing the platform, framework, and support for Ceph storage to natively integrate with cloud-native environments.

This module installs rook using the rook_ceph helm chart.

Please note this the default rook cluster installed by this module requires three worker nodes to actually come up.

For more details checkout [Rook](https://rook.github.io/docs/rook/latest-release/Getting-Started/intro/) docs.

<!-- TEMPLATE: Insert an image here of the infrastructure diagram. You can generate a starting image using instructions found at https://www.terraform.io/docs/cli/commands/graph.html#generating-images -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.rook](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rook_config"></a> [rook\_config](#input\_rook\_config) | Add-on configuration for Rook add-on | `any` | <pre>{<br>  "rook_name": "rook_ceph",<br>  "rook_namespace": "rook_ceph"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.8.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.8.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [helm_release.rook_ceph](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.rook_ceph_cluster](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rook_config"></a> [rook\_config](#input\_rook\_config) | Add-on configuration for Rook add-on | `any` | <pre>{<br>  "rook_ceph_cluster_name": "rook_ceph_cluster",<br>  "rook_ceph_cluster_namespace": "rook_ceph",<br>  "rook_ceph_name": "rook_ceph",<br>  "rook_ceph_namespace": "rook_ceph"<br>}</pre> | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
