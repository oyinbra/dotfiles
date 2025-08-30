#!/bin/bash

set -e

# Enable and configure systemd-resolved with AdGuard DNS
echo "[+] Setting up AdGuard DNS with DNS-over-TLS..."

# Ensure /etc/systemd/resolved.conf exists
sudo touch /etc/systemd/resolved.conf

# Backup existing config
sudo cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.bak

# Write DNS config
sudo bash -c 'cat > /etc/systemd/resolved.conf' <<EOF
[Resolve]
DNS=94.140.14.14 94.140.15.15
FallbackDNS=1.1.1.1 8.8.8.8
DNSOverTLS=yes
EOF

# Enable and restart systemd-resolved
sudo systemctl enable systemd-resolved --now

# Symlink resolv.conf to systemd-resolved
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Show status
echo "[+] DNS setup complete."
systemd-resolve --status | grep "DNS Servers" -A 2

