# charts

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs) to get started.

Because this is a private repo, in order to access it you need to create a _Personal Access Token_.

Once Helm has been set up correctly, add the repo as follows:

```bash
helm repo add iotics --username <github_username> --password <token> https://iotic-labs.github.io/charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.
You can then run `helm search repo iotics` to see the charts.

To install the `portal` chart:

```bash
helm install my-portal iotics/portal
```

To uninstall the chart:

```bash
helm delete my-portal
```
