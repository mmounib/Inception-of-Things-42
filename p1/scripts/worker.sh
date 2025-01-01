#!/bin/bash


# Retrieve the token from the controller node for joining the cluster
# K3S_TOKEN=$(ssh -o StrictHostKeyChecking=no -i /vagrant/.vagrant/machines/araysse/virtualbox/private_key vagrant@192.168.56.110 "sudo cat /var/lib/rancher/k3s/server/node-token")

# Install K3s in agent mode, specifying the controller's IP and token
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$(cat /vagrant_data/token.txt) sh -
sleep 10
