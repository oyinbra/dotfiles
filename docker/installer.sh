#!/bin/bash

# ############################################################
# NOTE: ~/dotfiles/installers/install_docker.sh
# NOTE: DOCKER SETUP
# NOTE: Install Docker and configure user privileges
# ############################################################

# ############################################################
# Install Docker
# ############################################################
sudo pacman -Sy --noconfirm docker

# ############################################################
# Enable and start Docker service
# ############################################################
sudo systemctl enable docker.service
sudo systemctl start docker.service

# ############################################################
# Create docker group if it doesn't exist
# ############################################################
getent group docker >/dev/null || sudo groupadd docker

# ############################################################
# Add current user to docker group
# ############################################################
sudo usermod -aG docker "$USER"

echo "==> Docker installed and user added to docker group."
echo "==> You must log out and back in for group changes to take effect."

# ############################################################
# Test Docker with hello-world container
# ############################################################
echo "==> Attempting to run 'hello-world' container..."
if docker run --rm hello-world 2>/dev/null; then
  echo "==> Docker is working without sudo."
else
  echo "==> Docker run failed. You may need to log out and back in for group permissions to apply."
fi
