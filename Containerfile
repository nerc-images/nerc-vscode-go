FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

USER root

RUN yum install -y \
  golang
RUN pip install \
  jupyterlab \
  bash_kernel
RUN python -m bash_kernel.install
RUN go install golang.org/x/tools/cmd/goimports@latest
RUN go install github.com/gopherdata/gophernotes@v0.7.5
RUN mkdir -p /opt/app-root/share/jupyter/kernels/gophernotes
RUN rsync -r "$(go env GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/" /opt/app-root/share/jupyter/kernels/gophernotes/
RUN sed -i -e "s|"'"'"gophernotes"'"'"|"'"'"$(go env GOPATH)/bin/gophernotes"'"'"|" /opt/app-root/share/jupyter/kernels/gophernotes/kernel.json
RUN jupyter kernelspec install /opt/app-root/share/jupyter/kernels/gophernotes --name go --prefix /opt/app-root
RUN rm -rf /opt/app-root/share/jupyter/kernels/gophernotes

USER 1001
