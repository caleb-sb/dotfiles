#!/bin/bash
#|---/ /+--------------------------------------+---/ /|#
#|--/ /-| Script to apply post install configs |--/ /-|#
#|-/ /--| Prasanth Rangan                      |-/ /--|#
#|/ /---+--------------------------------------+/ /---|#

source global_fn.sh
if [ $? -ne 0 ]; then
	echo "Error: unable to source global_fn.sh, please execute from $(dirname "$(realpath "$0")")..."
	exit 1
fi

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | SHELL="$(which fish)" sh -

# oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# sddm
if pkg_installed sddm; then

	if [ ! -d /usr/share/sddm/themes/sddm-astronaut-theme ]; then
		echo "configuring sddm..."
		sudo tar -xzf ${CloneDir}/Source/arcs/sddm-astronaut-theme.tar.gz -C /usr/share/sddm/themes/
		echo "[Theme]
    Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
	else
		echo "sddm is already configured..."
	fi

else
	echo "WARNING: sddm is not installed..."
fi

# dolphin
if pkg_installed dolphin && pkg_installed xdg-utils; then

	xdg-mime default org.kde.dolphin.desktop inode/directory
	echo "setting" $(xdg-mime query default "inode/directory") "as default file explorer..."

else
	echo "WARNING: dolphin is not installed..."
fi

# shell
./restore_shl.sh ${getShell}
