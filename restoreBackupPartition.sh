#!/bin/bash

# Add backup partition to fstab
echo "/dev/nvme0n1p4                            /Backup        btrfs   defaults                 0 0" | sudo tee --append /etc/fstab

