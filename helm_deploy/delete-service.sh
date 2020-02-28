#!/bin/bash
# Deletes a transient court-case-service pod

[ $# -ne 1 ] && { echo "Usage: $0 namespace"; exit 1; }

# Set vars
namespace=$1   # kubernetes namespace

helm del court-case-service \
--tiller-namespace $namespace \
--purge
