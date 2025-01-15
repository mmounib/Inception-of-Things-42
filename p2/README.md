This directory focuses on orchestrating multiple applications using Kubernetes within a VM managed by Vagrant.

  - **app.yaml**: defines Kubernetes deployments and services for each application. It includes the number of replicas, container images, and other configurations.
  - **ingress.yaml**: A YAML file that configures the ingress controller, managing external access to the services by routing traffic to the appropriate application based on defined rules.
