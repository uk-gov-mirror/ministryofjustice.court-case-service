#!/bin/bash
# Creates a transient kubernetes secret containing database credentials

[ $# -ne 1 ] && { echo "Usage: $0 namespace"; exit 1; }

# Set vars
namespace=$1   # kubernetes namespace

echo "Creating a secrets resource with DB creds in namespace: $namespace..."

kubectl create secret generic court-case-service-rds-instance-output \
--from-literal=database_username=root \
--from-literal=database_password=dev \
--from-literal=database_name=court_case_test \
--from-literal=rds_instance_endpoint=court-case-service-db-postgresql.$namespace.svc.cluster.local \
-n $namespace \
--dry-run \
-o yaml \
| kubectl apply -f -
