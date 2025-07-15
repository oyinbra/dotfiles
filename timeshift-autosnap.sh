#!/bin/bash

# Timeshift + Cronie Setup Script (Arch Linux)

set -e

echo "[+] Installing Timeshift and Cronie..."
sudo pacman -Syu --noconfirm timeshift cronie

echo "[+] Enabling Cronie..."
sudo systemctl enable --now cronie.service

echo "[+] Timeshift installed. Configure schedules via GUI or CLI:"
echo "    sudo timeshift-gtk"

