sudo k3d cluster create argocdIntegration
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

sudo kubectl wait --for=condition=Ready pods --all --timeout=69420s -n argocd
sudo kubectl get pods -n argocd

sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

sudo kubectl apply -f ./configs/app.yaml -n argocd
