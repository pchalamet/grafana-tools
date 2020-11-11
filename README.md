# grafana-tools

Use [grafana-tools](https://github.com/grafana-tools/sdk), and create a docker image with following tools:

* backup-dashboards
* backup-datasources
* import-dashboards
* import-datasources

# usage

Image has an entrypoint which use arguments:

* backup|import: action to run
* grafana url: Grafana endpoint
* api token: Token to use api (must be Admin)

The volume `/grafana-data` must be mounted to store/read data outside of the container.

```
docker run pchalamet/grafana-tools --volume=grafana-data:/grafana-data <backup|import> <grafana-url> <token-api>
```
