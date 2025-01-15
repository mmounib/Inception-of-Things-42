#!/bin/bash

rm -rf /vagrant_data/token.txt
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
while [ ! -e  "/var/lib/rancher/k3s/server/node-token" ]
do
  sleep 1
done
cat "/var/lib/rancher/k3s/server/node-token" > /vagrant_data/token.txt
sudo chmod 644 /etc/rancher/k3s/k3s.yaml