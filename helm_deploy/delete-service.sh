#!/bin/bash
# Deletes a transient court-case-service pod

[ $# -ne 2 ] && { echo "Usage: $0 namespace env_name"; exit 1; }

# Set vars
namespace=$1                                    # kubernetes namespace
env_name=$2                                     # environment name
deployment_name=court-case-service-$env_name    # deployment name

echo "Deleting a court-case-service deployment. Namespace: $namespace, deployment: $deployment_name..."

helm del $deployment_name \
--tiller-namespace $namespace \
--purge
