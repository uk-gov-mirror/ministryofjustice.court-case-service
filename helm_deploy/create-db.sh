#!/bin/bash
# Creates a transient postgresql database in a pod

[ $# -ne 3 ] && { echo "Usage: $0 namespace env_name values_file"; exit 1; }

# Set vars
namespace=$1                                         # kubernetes namespace
env_name=$2                                          # environment name
values_file=$3                                       # The helm values for this deployment
deployment_name=court-case-service-db-$env_name      # deployment name

echo "Creating a local postgresql database. Namespace: $namespace, deployment: $deployment_name..."

helm install stable/postgresql \
--name $deployment_name \
--values $values_file \
--wait \
--namespace $namespace \
--tiller-namespace $namespace
