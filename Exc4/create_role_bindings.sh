#!/bin/bash

kubectl create clusterrolebinding secrets-manager-security-binding \
  --clusterrole=secrets-manager \
  --group=security-team

kubectl create clusterrolebinding secrets-manager-devops-binding \
  --clusterrole=secrets-manager \
  --group=senior-devops
kubectl create clusterrolebinding cluster-manager-devops-binding \
  --clusterrole=cluster-manager \
  --group=senior-devops

bind_developer_role() {
  local namespace=$1
  local group=$2
  kubectl create rolebinding ${namespace}-developer-${group}-binding \
    --role=${namespace}-developer \
    --group=$group \
    -n $namespace
}

bind_viewer_role() {
  local namespace=$1
  local group=$2
  kubectl create rolebinding ${namespace}-viewer-${group}-binding \
    --role=${namespace}-viewer \
    --group=$group \
    -n $namespace
}

bind_developer_role "client" "client-developers"
bind_developer_role "client" "client-devops"
bind_viewer_role "client" "client-ops"

bind_developer_role "tenant" "tenant-developers"
bind_developer_role "tenant" "tenant-devops"
bind_viewer_role "tenant" "tenant-ops"

bind_developer_role "accounting" "accounting-developers"
bind_developer_role "accounting" "accounting-devops"
bind_viewer_role "accounting" "accounting-ops"

bind_developer_role "analytics" "analytics-developers"
bind_developer_role "analytics" "analytics-devops"
bind_viewer_role "analytics" "analytics-ops"
