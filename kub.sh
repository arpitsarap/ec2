#!/bin/bash

# Update the package list and install necessary packages
sudo apt-get update
sudo apt-get install -y apt-transport-https curl

# Install Docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Kubernetes components
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

# Enable and start Docker and kubelet services
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl enable kubelet
sudo systemctl start kubelet

# Initialize the Kubernetes cluster (use your preferred pod network, e.g., Calico)
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# Set up kubeconfig for the current user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install a pod network add-on (Calico in this example)
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# Display instructions for joining worker nodes (save this information)
echo "Kubernetes cluster has been initialized. To add worker nodes, use the following command on each worker node:"
echo "kubeadm join <MASTER_IP>:<MASTER_PORT> --token <TOKEN> --discovery-token-ca-cert-hash <DISCOVERY_TOKEN_HASH>"
