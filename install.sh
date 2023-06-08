#!/bin/bash
# Defining apps for installation
binarys="alacritty base-devel flatpak neofetch neovim bat btop curl tealdeer zsh"
flatpaks="org.mozilla.firefox com.discordapp.Discord com.spotify.Client eu.betterbird.Betterbird net.cozic.joplin_desktop io.github.lunarequest.NightPDF"

# Installing apps per package manager
if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache -y $binaries
elif [ -x "$(command -v apt)" ];     then sudo apt install -y $binaries
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install -y $binaries
elif [ -x "$(command -v dnf)" ];     then sudo dnf install -y $binaries
elif [ -x "$(command -v pacman)" ];  then sudo pacman -Syu --needed $binaries
elif [ -x "$(command -v yum)" ];     then sudo yum install -y $binaries
elif [ -x "$(command -v zypper)" ];  then sudo zypper install -y $binaries
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $binaries">&2; 
fi

# Installing AUR Helper
if [[ -x "$(command -v pacman)" ]]
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si
fi    

# Flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub $flatpaks


# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install NeoVim with default configs
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1


# Copy configurations to home folder (should be last)
cp -i -v -r * $HOME