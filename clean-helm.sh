#!/bin/bash

# helm uninstall -n fluxcd $(helm list -n fluxcd)

helm uninstall helm-operator flux -n fluxcd

kubectl delete ns fluxcd

kubectl delete ClusterRole flux

kubectl delete ClusterRoleBinding flux

kubectl delete ClusterRole helm-operator

kubectl delete ClusterRoleBinding helm-operator
