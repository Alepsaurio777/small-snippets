#!/usr/bin/env bash
os=$(grep -m1 '^NAME=' /etc/os-release)
echo $os
if  echo "$os" | grep -q "Ubuntu"; then
	echo "Es ubuntu"
elif echo "$os" | grep -q "Fedora"; then
	echo "Es fedora"
fi
