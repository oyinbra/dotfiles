#!/bin/bash

set -e

echo "[*] Installing Docker & Docker Compose..."
sudo pacman -Sy --noconfirm docker docker-compose
sudo systemctl enable --now docker

echo "[*] Cloning Nitter repo..."
git clone https://github.com/zedeus/nitter.git ~/nitter
cd ~/nitter

echo "[*] Creating docker-compose.yml..."
cat <<EOF > docker-compose.yml
version: '3'
services:
  nitter:
    image: zedeus/nitter:latest
    ports:
      - "127.0.0.1:8080:8080"
    restart: unless-stopped
EOF

echo "[*] Launching Nitter container..."
docker-compose up -d

echo "[✓] Nitter is now running locally at: http://127.0.0.1:8080"
echo "[✓] Example feed: http://127.0.0.1:8080/naval/rss"

