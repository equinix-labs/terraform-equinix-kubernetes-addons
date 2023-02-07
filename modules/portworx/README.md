<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->
## Portworx

<!-- TEMPLATE: Insert a short description here. -->

Portworx is a solution for persistent storage, disaster recovery, data security, cross-cloud and data migrations, and automated capacity management for Kubernetes apps.

For more details checkout [Portworx](https://docs.portworx.com/) docs.

### Prerequisites 
- Generic prerequisites - https://docs.portworx.com/install-portworx/prerequisites/
- Baremetal process - https://docs.portworx.com/install-portworx/kubernetes/bare-metal-kubernetes/
- KVDB - https://docs.portworx.com/concepts/internal-kvdb/

### Limitations
- Hardware: Current version for Equinix Metal only support cluster worker nodes with at least 2 dedicated storage disks, such as c3.medium.x86, m3-large, n3-xlarge or s3-xlarge. Checkout [server specifications](https://deploy.equinix.com/product/servers/) for more details.
- Operating System: Tested on CentOS 7, RHEL 8 , Ubuntu 20.04. There is a known issue preventing successful installation on Ubuntu 22.04+.

<!-- TEMPLATE: Please do not remove BEGIN_TF_DOCS/END_TF_DOCS comments below -->
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
