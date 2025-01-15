This directory is dedicated to setting up virtual machines (VMs) using Vagrant and installing K3s, a lightweight Kubernetes distribution.
  
  - **Vagrantfile**: This file defines the configuration for the VMs, specifying details such as the base image, CPU, memory allocation, and provisioning scripts. It automates the creation and setup of the virtual environment.
  - **server.sh**: A shell script that automates the installation of K3s in controller mode on the VM.
  - **worker.sh**: A shell script that automates the installation of K3s in agent mode on the VM.
