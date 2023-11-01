#!/bin/bash

# Install other packages and enable preload
paru -Sy preload tradingview
systemctl enable --now preload.service
