#!/usr/bin/env bash
os=$(grep -m1 '^NAME=' /etc/os-release)
echo $os
if  echo "$os" | grep -q "Ubuntu"; then
	echo "Es ubuntu"
	echo "Instalando VSC"
	sudo apt-get install wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
	rm -f microsoft.gpg
	cat /etc/apt/sources.list.d/vscode.sources << EOF
	Types: deb
	URIs: https://packages.microsoft.com/repos/code
	Suites: stable
	Components: main
	Architectures: amd64,arm64,armhf
	Signed-By: /usr/share/keyrings/microsoft.gpg
	EOF
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code

elif echo "$os" | grep -q "Fedora"; then
	echo "Es fedora"
	echo "Empezando con la descarga de aplicaciones"
	sudo dnf install 
fi
