#!/bin/bash

# Create the fluxcd namespace
kubectl create ns fluxcd

# Install Flux by specifying your fork URL
helm upgrade -i flux fluxcd/flux --wait \
--namespace fluxcd \
--set git.url=git@github.com:M-Wittner/helm-operator-get-started
# Install the HelmRelease Kubernetes custom resource definition
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/crds.yaml

# Install Flux Helm Operator with Helm v3 support
helm upgrade -i helm-operator fluxcd/helm-operator --wait \
--namespace fluxcd \
--set git.ssh.secretName=flux-git-deploy \
--set helm.versions=v3

# get the git deploy public key
kubectl -n fluxcd logs deployment/flux | grep identity.pub | cut -d '"' -f2