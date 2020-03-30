# Deploy to Neocities

An action that deploys a local directory from a workflow to Neocities.

## Usage

```yaml
- name: Deploy to Neocities
  # Don't use master, use a full 40 character commit hash, e.g.,
  # jonchang/deploy-neocities@deadbeef...
  uses: jonchang/deploy-neocities@master
  with:
    # Required, to access Neocities API.
    # https://neocities.org/settings
    # Set in Settings -> Secrets
    key: ${{ secrets.NEOCITIES_API_KEY }}
    # Required, local directory to deploy to Neocities
    dir: _site
    # Optional, if true, delete remote files not present locally
    clean: false
```

## See also

* [bcomnes/deploy-to-neocities](https://github.com/bcomnes/deploy-to-neocities), Node.js action with fancier diffing algorithm
