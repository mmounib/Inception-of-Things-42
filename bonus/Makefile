NAME = gitlab

all:
	sh scripts/argocd_instalation.sh

bonus:
	sh scripts/setup-gitlab.sh

clean:
	sudo kubectl delete namespace $(NAME)
	sudo kubectl delete namespace argocd
	sudo kubectl delete namespace devbonus
	sudo k3d cluster delete argocdIntegration

re : clean all

.PHONY: all clean re