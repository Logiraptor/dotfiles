#!/bin/bash

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

function link {
    src=$(realpath $1)
    target=$(realpath $2)

    if [[ -a $target ]]; then
        echo "ERROR: '$target' already exists; " \
             "please back it up or delete it then run again"
        return
    fi

    echo "Linking $src to $target"
    ln -s $src $target
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          echo "Unknown HOST OS, defaulting to linux"
                read -n 1 -p "continue? (y/n): " choice
                echo
                if [[ $choice != 'y' ]]; then
                    exit 1
                fi
                machine=Linux
esac

echo "Installing dotfiles for ${machine}"

function installSpaceMacs {
    git clone -b develop git@github.com:syl20bnr/spacemacs ~/.emacs.d
    link ./.spacemacs ~/.spacemacs
}

function installLinux {
    installSpaceMacs
    link ./.bashrc ~/.bashrc
    link ./.bash_aliases ~/.aliases
    link ./.profile ~/.profile

    link ./i3 ~/.config/i3
    link ./i3status ~/.config/i3status
    link ./compton.conf ~/.config/compton.conf

    link ./.gitconfig ~/.gitconfig
}

function installMac {
    installSpaceMacs
    link ./.zshrc ~/.zshrc
    link ./mac.bash_aliases ~/.aliases

    link ./.gitconfig ~/.gitconfig

    brew install wallpaper
}

install$machine
