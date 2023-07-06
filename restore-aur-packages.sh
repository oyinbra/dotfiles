#!/bin/bash

paru -Sy preload tradingview
systemctl enable --now preload.service
