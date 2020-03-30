#!/bin/bash
# Deletes a transient database

[ $# -ne 2 ] && { echo "Usage: $0 namespace env_name"; exit 1; }

# Set vars
namespace=$1   # kubernetes namespace
env_name=$2       # environment name
deployment_name=court-case-service-db-$env_name       # deployment name

echo "Deleting a local postgresql database. Namespace: $namespace, deployment: $deployment_name..."

helm del $deployment_name \
--tiller-namespace $namespace  \
--purge

kubectl delete pvc data-$deployment_name-postgresql-0 -n $namespace
