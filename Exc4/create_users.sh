#!/bin/bash

mkdir -p certificates

create_user_cert() {
  local username=$1
  local group=$2

  openssl genrsa -out certificates/${username}.key 2048
  openssl req -new -key certificates/${username}.key -out certificates/${username}.csr -subj "/CN=${username}/O=${group}"
  openssl x509 -req -in certificates/${username}.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out certificates/${username}.crt -days 365
}

create_user_cert "ib-employee" "security-team"

create_user_cert "senior-devops" "senior-devops"

create_user_cert "client-developer" "client-developers"
create_user_cert "client-devops" "client-devops"
create_user_cert "client-ops" "client-ops"

create_user_cert "tenant-developer" "tenant-developers"
create_user_cert "tenant-devops" "tenant-devops"
create_user_cert "tenant-ops" "tenant-ops"

create_user_cert "accounting-developer" "accounting-developers"
create_user_cert "accounting-devops" "accounting-devops"
create_user_cert "accounting-ops" "accounting-ops"

create_user_cert "analytics-developer" "analytics-developers"
create_user_cert "analytics-devops" "analytics-devops"
create_user_cert "analytics-ops" "analytics-ops"
