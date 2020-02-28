#!/bin/bash
# Deletes a transient database

[ $# -ne 1 ] && { echo "Usage: $0 namespace"; exit 1; }

# Set vars
namespace=$1   # kubernetes namespace

helm del court-case-service-db \
--tiller-namespace $namespace  \
--purge

kubectl delete pvc data-court-case-service-db-postgresql-0 -n $namespace
