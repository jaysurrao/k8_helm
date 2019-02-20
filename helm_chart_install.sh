#! /usr/bin/env bash

ENV_NAME=$1

cd $(dirname $0)

IBM=`pwd`

helm_charts_config_dir = "$IBM/../chart-env-config"
helm_charts_config_env_dir = "$helm_charts_config_dir/dev"
helm_charts_config_template_dir = 
HELM_CHARTS_CONFIG_TEMPLATE_DIR="$helm_charts_config_dir/template"

kubectl config use-context dev

# Initialise helm (install "tiller", helm server on k8s cluster)
helm init
helm repo add k8_helm https://github.com/jaysurrao/k8_helm
helm repo update

# Create directory for environent helm charts' values
mkdir $helm_charts_config_env_dir

# Install node-exporter helm chart
helm install k8_helm/testchart --namespace kube-system
