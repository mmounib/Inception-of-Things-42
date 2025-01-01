NAME = argocdIntegration

all:
	sh scripts/main-installation.sh
dep:
	sh scripts/dependency-installation.sh

clean:
	sudo k3d cluster delete $(NAME)

re : clean all

.PHONY: all clean re
