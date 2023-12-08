#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
source $APPINST_BASEDIR/src/helpers/ubuntu_universe.sh

show_info_log "Removing old version"
sudo apt remove -y docker docker-engine docker.io containerd runc

show_info_log "Install dependencies"
sudo apt install -y ca-certificates curl gnupg lsb-release

distro=$(lsb_release -i | cut -f2 | awk '{ print tolower($1) }')
distro_version=$(. /etc/os-release && echo "$VERSION_CODENAME")

case $distro in
ubuntu)
  show_info_log "Ubuntu detected"
  ;;
linuxmint)
  show_info_log "Linux Mint detected"
  distro="ubuntu"
  distro_version=$(. /etc/os-release && echo "$UBUNTU_CODENAME")
  ;;
debian)
  show_info_log "Debian detected"
  ;;
*)
  show_error_log "Distro [$distro] not supported"
  exit 1
  ;;
esac

show_info_log "Installing..."
# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$distro/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$distro \
  $distro_version stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

show_success_log "Docker successfully installed"
