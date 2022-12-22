# Terraform Equinix Kubernetes Addons

[![Experimental](https://img.shields.io/badge/Stability-Experimental-red.svg)](https://github.com/equinix-labs/standards#about-uniform-standards)
[![terraform](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml/badge.svg)](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml)

> **[Experimental](https://github.com/equinix-labs/equinix-labs/blob/main/experimental-statement.md)**
> This project is experimental and a work in progress. The support is provided best-effort by the Kubernetes Addons community.
>
>

This repository contains a collection of Terraform modules (addons) to help automate the deploy and management of Kubernetes components in Kubernetes environments running on [Equinix Metal](https://deploy.equinix.com/) baremetal.

## Usage

This project is intended to be used as a Terraform module.

This project may also be forked, cloned, or downloaded and modified as needed as the base in your integrations and deployments.

### Prerequisites

- Have a running Kubernetes cluster running on [Equinix Metal](https://deploy.equinix.com/) baremetal.
- Install Terraform using the official guides at https://learn.hashicorp.com/tutorials/terraform/install-cli.
- It may be useful to install [metal-cli](https://github.com/equinix/metal-cli/#installation).

### Steps

Checkout `examples` directory within any of the available modules to define required files and installation steps.

## Examples

Each module includes an `examples` directory with configuration examples specific to them.

As this project grows and more modules become available, an `examples` directory will be included in the root directory, with blueprints to provision complete solutions.

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.8.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_provider_equinix_metal"></a> [cloud\_provider\_equinix\_metal](#module\_cloud\_provider\_equinix\_metal) | ./modules/cloud_provider_equinix_metal | n/a |
| <a name="module_longhorn"></a> [longhorn](#module\_longhorn) | ./modules/longhorn | n/a |
| <a name="module_metallb"></a> [metallb](#module\_metallb) | ./modules/metallb | n/a |
| <a name="module_rook"></a> [rook](#module\_rook) | ./modules/rook | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_equinix_metro"></a> [equinix\_metro](#input\_equinix\_metro) | Equinix metro code | `string` | n/a | yes |
| <a name="input_equinix_project"></a> [equinix\_project](#input\_equinix\_project) | Equinix project | `string` | n/a | yes |
| <a name="input_kubeconfig_local_path"></a> [kubeconfig\_local\_path](#input\_kubeconfig\_local\_path) | Depending on your setup, you may need to specify the path to the kubeconfig file locally | `string` | n/a | yes |
| <a name="input_kubeconfig_remote_path"></a> [kubeconfig\_remote\_path](#input\_kubeconfig\_remote\_path) | Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server | `string` | n/a | yes |
| <a name="input_longhorn_config"></a> [longhorn\_config](#input\_longhorn\_config) | Configuration for Longhorn add-on | `any` | n/a | yes |
| <a name="input_rook_config"></a> [rook\_config](#input\_rook\_config) | Configuration for Rook add-on | `any` | n/a | yes |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | The address of the server from where to perform kubectl installations and changes | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function | `string` | n/a | yes |
| <a name="input_cloud_provider_equinix_metal_config"></a> [cloud\_provider\_equinix\_metal\_config](#input\_cloud\_provider\_equinix\_metal\_config) | Configuration for cloudproviderequinixmetal add-on | `any` | `{}` | no |
| <a name="input_enable_cloud_provider_equinix_metal"></a> [enable\_cloud\_provider\_equinix\_metal](#input\_enable\_cloud\_provider\_equinix\_metal) | Enable cloudproviderequinixmetal add-on | `bool` | `false` | no |
| <a name="input_enable_longhorn"></a> [enable\_longhorn](#input\_enable\_longhorn) | Enable Longhorn add-on | `bool` | `false` | no |
| <a name="input_enable_metallb"></a> [enable\_metallb](#input\_enable\_metallb) | Enable Metallb add-on | `bool` | `false` | no |
| <a name="input_enable_rook"></a> [enable\_rook](#input\_enable\_rook) | Enable Rook add-on | `bool` | `false` | no |
| <a name="input_metallb_config"></a> [metallb\_config](#input\_metallb\_config) | Configuration for Metallb add-on | `any` | `{}` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | The user to use for the connection | `string` | `"root"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `['k8s`,`production`] | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_provider_equinix_metal"></a> [cloud\_provider\_equinix\_metal](#output\_cloud\_provider\_equinix\_metal) | Cloud Provider Equinix Metal add-on outputs |
| <a name="output_cloud_provider_equinix_metal_prerequisites"></a> [cloud\_provider\_equinix\_metal\_prerequisites](#output\_cloud\_provider\_equinix\_metal\_prerequisites) | Cloud Provider Equinix Metal add-on prerequisites for device provisioning |
| <a name="output_metallb"></a> [metallb](#output\_metallb) | MetaLB addon outputs |
<!-- END_TF_DOCS -->

## Adding a new Addon

If you are interested in adding new addon, please see [CONTRIBUTING A NEW ADDON](CONTRIBUTING.md#contributing-a-new-addon) section for more information and tools available.
