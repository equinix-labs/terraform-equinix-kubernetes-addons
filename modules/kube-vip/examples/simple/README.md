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
<!-- END_TF_DOCS -->
