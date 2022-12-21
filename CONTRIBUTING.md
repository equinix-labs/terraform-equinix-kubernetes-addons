# Hello Contributors

Thx for your interest! We're so glad you're here.

## Contributing a new Addon

Contributions are greatly appreciated and proposing/defining a new addon enriches and reaffirms the need for this project.

To facilitate the creation of a new addon you can find a script available at [utils/generate_addon_structure](./.utils/generate_addon_structure.sh) which helps to generate and modify the base files needed to enable a new addon. 

Usage:

```bash
cd .utils; ./generate_addon_structure.sh [ -n NAME ] [ -w DOCS_WEBSITE ]
```
- (-n) (Required) Name of the addon
- (-w) (Required) Addon official documentation home page URL

For example running this:

```bash
cd .utils; ./generate_addon_structure.sh -n 'Kube-vip' -w 'https://kube-vip.io/docs/'
```

You will get something like:

```
kube-vip addon layout successfully created!

Modified project files:
- terraform-equinix-kubernetes-addons/main.tf
- terraform-equinix-kubernetes-addons/outputs.tf
- terraform-equinix-kubernetes-addons/variables.tf

New folder with addon's editable files:
- terraform-equinix-kubernetes-addons/modules/kube-vip/
```

After running the script successfully, you will need to modify the newly added files to include the logic for the proper installation and configuration of the new addon. You can find some inspiration by browsing the [modules](./modules/) already available.

Before starting any work, please checkout [Contributing via Pull Request](#contributing-via-pull-request) section below.

## Contributing via Pull Request

Before starting any work or sending us a pull request, please ensure that:

- Your working branch is up-to-date with the latest source on the main branch.
- Check issues and pull requests (open/merged) to make sure someone else hasn't already addressed that issue.
- You open an issue to discuss your proposal.

To learn how to send us a pull request, please see [Contributing to projects](https://docs.github.com/en/get-started/quickstart/contributing-to-projects) in the GitHub Docs.

## Code of Conduct

Available via [CODE_OF_CONDUCT](CODE_OF_CONDUCT.md).

## How to Submit Change Requests

Please submit change requests and / or features via [Issues](https://github.com/equinix-labs/terraform-equinix-kubernetes-addons/issues). There's no guarantee it'll be changed, but you never know until you try. We'll try to add comments as soon as possible, though.

## How to Report a Bug

Bugs are problems in code, in the functionality of an application or in its UI design; you can submit them through [Issues/(https://github.com/equinix-labs/terraform-equinix-kubernetes-addons/issues) as well.
