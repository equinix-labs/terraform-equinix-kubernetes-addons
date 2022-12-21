## Rook

Rook is an open source cloud-native storage orchestrator, providing the platform, framework, and support for Ceph storage to natively integrate with cloud-native environments.

This module installs rook using the rook-ceph helm chart.

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
| <a name="input_rook_config"></a> [rook\_config](#input\_rook\_config) | Add-on configuration for Rook add-on | `any` | <pre>{<br>  "rook_name": "rook-ceph",<br>  "rook_namespace": "rook-ceph"<br>}</pre> | no |

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
| [helm_release.rook-ceph](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.rook-ceph-cluster](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rook_config"></a> [rook\_config](#input\_rook\_config) | Add-on configuration for Rook add-on | `any` | <pre>{<br>  "rook-ceph-cluster_name": "rook-ceph-cluster",<br>  "rook-ceph-cluster_namespace": "rook-ceph",<br>  "rook-ceph_name": "rook-ceph",<br>  "rook-ceph_namespace": "rook-ceph"<br>}</pre> | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
