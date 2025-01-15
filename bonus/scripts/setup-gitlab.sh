#!/bin/bash


curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
sleep 2

helm repo add gitlab https://charts.gitlab.io/
helm repo update
sleep 2

sudo kubectl create namespace gitlab

helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --namespace gitlab \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.class=nginx \
  --set global.hosts.domain=localhost \
  --set global.hosts.externalIP=0.0.0.0 \
  --set global.hosts.https=false \
  --set global.rails.bootsnap.enabled=false \
  --set global.shell.port=32022 \
  --set certmanager.install=false \
  --set nginx-ingress.enabled=false \
  --set prometheus.install=false \
  --set gitlab-runner.install=false \
  --set gitlab.webservice.minReplicas=2 \
  --set gitlab.webservice.maxReplicas=2 \
  --set gitlab.sidekiq.minReplicas=1 \
  --set gitlab.sidekiq.maxReplicas=1 \
  --set gitlab.gitlab-shell.minReplicas=1 \
  --set gitlab.gitlab-shell.maxReplicas=1 \
  --set gitlab.gitlab-shell.service.type=NodePort \
  --set gitlab.gitlab-shell.service.nodePort=32022 \
  --set registry.hpa.minReplicas=1 \
  --set registry.hpa.maxReplicas=1

sudo kubectl wait -n gitlab --for=condition=Ready pods --all --timeout=220s
kubectl wait --for=condition=available --timeout=500s deployment -l app=webservice -n gitlab
sudo kubectl get pods -n gitlab


sudo kubectl -n gitlab get secret gitlab-gitlab-initial-root-password -o jsonpath='{.data.password}' | base64 --decode ; echo


sudo kubectl port-forward service/gitlab-webservice-default -n gitlab 8000:8181 &

