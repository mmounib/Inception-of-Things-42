sudo k3d cluster create argocdIntegration -p 8080:80@loadbalancer -p 8443:443@loadbalancer -p 8888:8888@loadbalancer
sudo kubectl create namespace argocd
sudo kubectl create namespace devbonus

sudo k3d kubeconfig get argocdIntegration > ~/.kube/config

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sleep 5
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

sudo kubectl wait --for=condition=Ready pods --all --timeout=160s -n argocd
    # kubectl wait --for=condition=available --timeout=300s deployment/argocd-server -n argocd
sleep 5
sudo kubectl get pods -n argocd
sudo echo "=======================\n"
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
sudo echo "=======================\n"