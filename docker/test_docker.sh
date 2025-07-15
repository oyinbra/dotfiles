#!/bin/bash

echo "==> Attempting to run 'hello-world' container..."
if docker run --rm hello-world 2>/dev/null; then
  echo "==> Docker is working without sudo."
else
  echo "==> Docker run failed. You may need to log out and back in for group permissions to apply."
fi
