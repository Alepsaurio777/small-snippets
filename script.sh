#!/usr/bin/env bash
set -euo pipefail

os=$(grep -m1 '^NAME=' /etc/os-release)
echo $os
if  echo "$os" | grep -q "Ubuntu"; then
	echo "Es ubuntu"
	echo "Instalando VSC"
	sudo apt-get install -y wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
	rm -f microsoft.gpg
	cat <<EOF| sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null 
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

	sudo apt install -y apt-transport-https
	sudo apt update -y
	sudo apt install -y code 
	sudo apt install -y git
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
	sh -c "$(curl -fsLS https://get.chezmoi.io)"
	chezmoi init Alepsaurio777
	chezmoi apply
	
elif echo "$os" | grep -q "Fedora"; then
	echo "Es fedora"
	echo "Empezando con la descarga de aplicaciones"
	sudo dnf install 
fi
 
