#!/bin/bash

namespaces=("client" "tenant" "accounting" "analytics")
for ns in "${namespaces[@]}"; do
  kubectl create namespace $ns
done
