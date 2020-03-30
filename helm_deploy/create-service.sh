#!/bin/bash
# Creates a transient court-case-service pod

[ $# -ne 5 ] && { echo "Usage: $0 namespace env_name court_case_service_path values_file cert_secret"; exit 1; }

# Set vars
namespace=$1                                                       # kubernetes namespace
env_name=$2                                                        # environment name
court_case_service_path=$3                                         # Location of court case service source
values_file=$4                                                     # The helm values for this deployment
deployment_name=court-case-service-$env_name                       # deployment name
db_secret_name=court-case-service-$env_name-rds-instance-output    # k8s database secret name
service_secret_name=court-case-service-$env_name-secrets           # k8s service secret name
cert_secret=$5                                                     # TLS cert secret name

echo "Creating a court-case-service deployment. Namespace: $namespace, deployment: $deployment_name..."

helm install $court_case_service_path/helm_deploy/court-case-service \
--name $deployment_name \
--values $values_file \
--set secrets.db.secret_name=$db_secret_name \
--set secrets.service.secret_name=$service_secret_name \
--set ingress.hosts[0].host=$deployment_name \
--set ingress.hosts[0].cert_secret=$cert_secret \
--wait \
--namespace $namespace \
--tiller-namespace $namespace
