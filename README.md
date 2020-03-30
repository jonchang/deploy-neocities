# Deploy to Neocities

An action that deploys a local directory from a workflow to Neocities.

## Usage

```yaml

- name: Deploy to Neocities
  # Don't use master in production, use a SHA1 hash, e.g.,
  # jonchang/deploy-neocities@deadbeef
  uses: jonchang/deploy-neocities@master
  with:
    # From https://neocities.org/settings
    # Set in Settings -> Secrets
    key: ${{ secrets.NEOCITIES_API_KEY }}
    # Must be visible in Docker container
    # See https://help.github.com/en/actions/reference/virtual-environments-for-github-hosted-runners#docker-container-filesystem
    dir: _site
    # Optional, will delete remote files not present locally
    clean: false
```
