#!/bin/bash
# kubelet requires swap off
swapoff -a
# keep swap off after reboot
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
curl -sfL https://get.k3s.io | sh -s -- --write-kubeconfig-mode=644

sleep 20

kubectl apply -f /vagrant/app1.yaml
kubectl apply -f /vagrant/app2.yaml
kubectl apply -f /vagrant/app3.yaml
kubectl apply -f /vagrant/ingress.yaml

sleep 20

kubectl get all
