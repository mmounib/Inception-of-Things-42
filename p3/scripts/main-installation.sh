sudo k3d cluster create argocdIntegration -p 8080:80@loadbalancer -p 8443:443@loadbalancer -p 8888:8888@loadbalancer
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

sudo k3d kubeconfig get argocdIntegration > ~/.kube/config

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

sudo kubectl wait --for=condition=Ready pods --all --timeout=69420s -n argocd
sudo kubectl get pods -n argocd

sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

sudo kubectl apply -f ../p3/confs/app.yaml -n argocd
