# charts

Helm Charts for Iotics.

There is [chart-releaser-action](https://github.com/helm/chart-releaser-action/) GitHub Action which runs for every commit on the `main` branch
and publishes any new or updated charts under `./charts` as Helm packages under GitHub Releases and updates the Helm repository `index.yaml` on the `gh-pages` branch, which is then used by Helm to list the known packages (pointing to GitHub Pages for this repo).

## Useful Links

- <https://helm.sh/docs/howto/chart_releaser_action/>
- <https://github.com/helm/chart-releaser>
- <https://github.com/helm/chart-releaser-action/>
- <https://helm.sh/docs/topics/chart_repository/#github-pages-example>
- <https://helm.sh/docs/intro/install/#from-apt-debianubuntu>

## Troubleshooting GitHub Action

You can test the `chart-releaser-action` GitHub Action locally by using the same docker container image and the same steps that the GitHub Action is using.

See [cr.sh](https://github.com/helm/chart-releaser-action/blob/main/cr.sh)

```bash
docker run -it --rm -v $(pwd):/app ubuntu:latest /bin/bash
cd /app
# install dependencies
apt-get update && apt-get install -y curl git 
# install helm
curl https://baltocdn.com/helm/signing.asc | apt-key add -
apt-get install -y apt-transport-https apt-utils gnupg
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update && apt-get install helm
helm version
# download cr
curl -sSLo cr.tar.gz "https://github.com/helm/chart-releaser/releases/download/v1.3.0/chart-releaser_1.3.0_linux_amd64.tar.gz"
# setup
mkdir -p .cr-release-packages .cr-index .cache
cache_dir=.cache
charts_dir=charts
tar -xzf cr.tar.gz -C "$cache_dir"
export PATH="$cache_dir:$PATH"
cr
# run cr
cr package charts/portal
# Successfully packaged chart in /app/charts/portal and saved it to: .cr-release-packages/portal-0.1.0.tgz
```

Note: You could also try to run the whole script, but that pulls down the code from GitHub rather than using local code so not so great for troubleshooting…

```bash
CR_TOKEN="x" bash <(curl -Ls https://raw.githubusercontent.com/helm/chart-releaser-action/main/cr.sh) -o Iotic-Labs -r charts
```

## Technology Used

- GitHub Actions
- Markdown
- Docker
- Helm
- Bash
- YAML
- Git
