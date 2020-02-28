#!/bin/bash
# Creates a transient court-case-service pod

[ $# -ne 3 ] && { echo "Usage: $0 namespace env_name values_file"; exit 1; }

# Set vars
namespace=$1   # kubernetes namespace
env_name=$2    # environment name
values_file=$3    # The helm values for this deployment

echo "Creating a court-case-service deployment in namespace: $namespace..."

helm install external_charts/court-case-service/helm_deploy/court-case-service \
--name court-case-service \
--values $values_file \
--wait \
--namespace $namespace \
--tiller-namespace $namespace
