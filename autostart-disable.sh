
#!/bin/bash

# Disable Docker Desktop from auto-starting
systemctl --user disable docker-desktop
systemctl --user stop docker-desktop

# Remove from autostart if present
rm -f ~/.config/autostart/docker-desktop.desktop

# Prevent execution if manually added to startup files
sed -i '/docker-desktop/d' ~/.bashrc ~/.zshrc ~/.profile ~/.xprofile 2>/dev/null

echo "Docker Desktop auto-start disabled."
