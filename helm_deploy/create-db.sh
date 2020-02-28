#!/bin/bash
# Creates a transient postgresql database in a pod

[ $# -ne 3 ] && { echo "Usage: $0 namespace env_name values_file"; exit 1; }

# Set vars
namespace=$1      # kubernetes namespace
env_name=$2       # environment name
values_file=$3    # The helm values for this deployment

echo "Creating a local postgresql database in a pod in namespace: $namespace..."

helm install stable/postgresql \
--name court-case-service-db \
--values $values_file \
--wait \
--namespace $namespace \
--tiller-namespace $namespace
