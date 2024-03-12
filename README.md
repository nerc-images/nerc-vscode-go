# vscode-go

An OpenShift AI Image running VSCode for Go Lang development.
- Based on the [gophernotes project](https://github.com/gopherdata/gophernotes)
on GitHub for Jupyter Lab Notebook integration.
- Uses Go version 1.21.7 support.

Base image: [quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest](https://github.com/opendatahub-io-contrib/workbench-images)

| Python packages | Description |
| --- | --- |
| jupyterlab | A web-based user interface to work with Jupyter notebooks, editors, terminals, and custom components |

| Custom packages | Description |
| --- | --- |
| gophernotes | Go kernel for Jupyter notebooks and nteract. |

| System packages | Description |
| --- | --- |
| golang | The Go Programming Language. |

You can pull the latest [vscode-go container image](https://github.com/nerc-images/vscode-go/pkgs/container/vscode-go) below:

```
podman pull quay.io/nerc-images/vscode-go:latest
```
