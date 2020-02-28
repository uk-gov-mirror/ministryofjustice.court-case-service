#!/bin/bash
# Deletes a transient kubernetes secret containing database credentials

[ $# -ne 1 ] && { echo "Usage: $0 namespace"; exit 1; }

# Set vars
namespace=$1   # kubernetes namespace

kubectl delete secret \
  court-case-service-rds-instance-output \
  -n $namespace
