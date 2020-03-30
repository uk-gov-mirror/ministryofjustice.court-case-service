#!/bin/bash
# Populates a court-case database with test data

[ $# -ne 4 ] && { echo "Usage: $0 namespace env_name court_case_service_path data_path"; exit 1; }

# Set vars
namespace=$1                                                    # kubernetes namespace
env_name=$2                                                     # environment name
court_case_service_path=$3                                      # Location of court case service source
data_path=$4                                                    # Test data file
service_name=court-case-service-db-$env_name-postgresql         # db service name
secret_name=court-case-service-$env_name-rds-instance-output    # k8s secret name

echo "Populating the database with test data..."

kubectl port-forward --namespace $namespace svc/$service_name 5432:5432  >/dev/null 2>&1 &

flyway \
-url=jdbc:postgresql://127.0.0.1:5432/court_case_test \
-user=`kubectl get secret --namespace $namespace $secret_name -o jsonpath="{.data.database_username}" | base64 --decode` \
-password=`kubectl get secret --namespace $namespace $secret_name -o jsonpath="{.data.database_password}" | base64 --decode` \
-locations=filesystem:$court_case_service_path/src/main/resources/db/migration/courtcase,filesystem:$data_path \
-schemas=courtcaseservice \
-defaultSchema=courtcaseservice \
-placeholders.today=`date '+%F'` \
-placeholders.tomorrow=`date --date="next day" '+%F'` \
migrate

fuser -k 5432/tcp
