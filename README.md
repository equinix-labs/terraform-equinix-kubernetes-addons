# Terraform Equinix Kubernetes Addons

[![Experimental](https://img.shields.io/badge/Stability-Experimental-red.svg)](https://github.com/equinix-labs/standards#about-uniform-standards)
[![terraform](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml/badge.svg)](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml)

> **[Experimental](https://github.com/equinix-labs/equinix-labs/blob/main/experimental-statement.md)**
> This project is experimental and a work in progress. The support is provided best-effort by the Kubernetes Addons community.
>
>

This repository contains a collection of Terraform modules (addons) to help automate the deploy and management of Kubernetes components in Kubernetes environments running on [Equinix Metal](https://deploy.equinix.com/) baremetal.

## Getting Started
//TODO(ocobleseqx)

## Usage
//TODO(ocobleseqx)

## Examples
//TODO(ocobleseqx)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | >= 1.11.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_metallb"></a> [metallb](#module\_metallb) | ./modules/metallb | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_metallb"></a> [enable\_metallb](#input\_enable\_metallb) | Enable Metallb add-on | `bool` | `false` | no |
| <a name="input_equinix_metro"></a> [equinix\_metro](#input\_equinix\_metro) | Equinix metro code | `string` | n/a | yes |
| <a name="input_equinix_project"></a> [equinix\_project](#input\_equinix\_project) | Equinix project | `string` | n/a | yes |
| <a name="input_kubeconfig_remote_path"></a> [kubeconfig\_remote\_path](#input\_kubeconfig\_remote\_path) | Depending on your setup, you may need to specify the path to the kubeconfig file hosted on the remote server | `string` | n/a | yes |
| <a name="input_metallb_config"></a> [metallb\_config](#input\_metallb\_config) | Configuration for Metallb add-on | `any` | `{}` | no |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | The address of the server from where to perform kubectl installations and changes | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | The user to use for the connection | `string` | `"root"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `['k8s`,`production`] | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metallb"></a> [metallb](#output\_metallb) | MetaLB addon outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
