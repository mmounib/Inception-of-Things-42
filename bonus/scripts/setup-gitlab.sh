#!/bin/bash


curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
sleep 2

helm repo add gitlab https://charts.gitlab.io/
helm repo update
sleep 2


kubectl create namespace gitlab

helm install gitlab gitlab/gitlab \
--namespace gitlab \
    --set global.hosts.domain=localhost \
    --set global.hosts.https=false \
    --set certmanager-issuer.email=me@example.com \
    --set global.ingress.configureCertmanager=false \
    #--set gitlab-runner.gitlabUrl=gitlab-webservice-default.gitlab.svc.cluster.local \
    --set gitlab-runner.install=false

kubectl wait -n gitlab --for=condition=Ready pods --all --timeout=120s
kubectl get pods -n gitlab


kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo


kubectl port-forward service/gitlab-webservice-default -n gitlab 8444:8282 &
