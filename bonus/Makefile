NAME = gitlab

all:
	sh scripts/argocd_instalation.sh

bonus:
	sh scripts/setup-gitlab.sh

app:
	sh scripts/app.sh

clean:
	kubectl delete all --all -n gitlab
	sudo kubectl delete namespace $(NAME)
	sudo kubectl delete namespace argocd
	sudo kubectl delete namespace devbonus
	sudo k3d cluster delete argocdIntegration
	sudo docker system prune -af

re : clean all

.PHONY: all clean re