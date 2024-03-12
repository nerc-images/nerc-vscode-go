FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

USER root

RUN yum install -y \
  golang
RUN pip install jupyterlab
RUN go install github.com/gopherdata/gophernotes@v0.7.5
RUN mkdir -p /opt/app-root/share/jupyter/kernels/gophernotes
WORKDIR /opt/app-root/share/jupyter/kernels/gophernotes
RUN cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "."
RUN chmod +w ./kernel.json
RUN sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
RUN jupyter kernelspec install /opt/app-root/share/jupyter/kernels/gophernotes

USER 1001
