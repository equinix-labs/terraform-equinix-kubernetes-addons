## terraform-equinix-template

<!-- TEMPLATE: Review all "TEMPLATE" comments and remove them when applied. -->
<!-- TEMPLATE: replace "template" with the name of your project. The prefix "terraform-equinix-" informs the Terraform registry that this project is a Terraform module associated with the Equinix provider, Oreserve this prefix.  "terraform-metal-" may also be used for Equinix Metal modules, but "terraform-equinix-" will work too. -->
[![Experimental](https://img.shields.io/badge/Stability-Experimental-red.svg)](https://github.com/equinix-labs/standards#about-uniform-standards)
[![terraform](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml/badge.svg)](https://github.com/equinix-labs/terraform-equinix-template/actions/workflows/integration.yaml)

`terraform-equinix-template` is a minimal Terraform module that utilizes [Terraform providers for Equinix](https://registry.terraform.io/namespaces/equinix) to provision digital infrastructure and demonstrate higher level integrations.

<!-- TEMPLATE: Insert an image here of the infrastructure diagram. You can generate a starting image using instructions found at https://www.terraform.io/docs/cli/commands/graph.html#generating-images -->

### Usage

This project is experimental and supported by the user community. Equinix does not provide support for this project.

Install Terraform using the official guides at <https://learn.hashicorp.com/tutorials/terraform/install-cli>.

This project may be forked, cloned, or downloaded and modified as needed as the base in your integrations and deployments.

This project may also be used as a [Terraform module](https://learn.hashicorp.com/collections/terraform/modules).

To use this module in a new project, create a file such as:

```hcl
# main.tf
terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
    }
    metal = {
      source = "equinix/metal"
    }
}

module "example" {
  source = "github.com/equinix-labs/template"
  # TEMPLATE: replace "template" with the name of the repo after the terraform-equinix- or terraform-metal- prefix.

  # Published modules can be sourced as:
  # source = "equinix-labs/template/equinix"
  # See https://www.terraform.io/docs/registry/modules/publish.html for details.

  # version = "0.1.0"

  # TEMPLATE: insert required variables here
}
```

Run `terraform init -upgrade` and `terraform apply`.

<!-- TEMPLATE: Expand this section with any additional information or requirements. -->

#### Variables

|     Variable Name      |  Type   |        Default Value        | Description                                             |
| :--------------------: | :-----: | :-------------------------: | :------------------------------------------------------ |
|                        |         |                             |                                                         |

<!-- TEMPLATE: If published, remove the table and use the following: See <https://registry.terraform.io/modules/equinix-labs/template/equinix/latest?tab=inputs> for a description of all variables. -->

#### Outputs

|     Variable Name      |  Type   | Description                                             |
| :--------------------: | :-----: | :------------------------------------------------------ |
|                        |         |                                                         |

<!-- TEMPLATE: If published, remove the table and use the following: See <https://registry.terraform.io/modules/equinix-labs/template/equinix/latest?tab=outputs> for a description of all outputs. -->

### Examples

- [examples/simple](examples/simple/)

