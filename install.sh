#!/bin/bash

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

function installLinux {
    git submodule init
    git submodule update
    link ./.bashrc ~/.bashrc
    link ./.bash_aliases ~/.aliases
    link ./.profile ~/.profile
    link ./.emacs.d/ ~/.emacs.d/
    link ./.spacemacs ~/.spacemacs

    link ./i3 ~/.config/i3
    link ./i3status ~/.config/i3status
    link ./compton.conf ~/.config/compton.conf

    link ./.gitconfig ~/.gitconfig

    link ./brightness.sh ~/bin/brightness.sh
    link ./t.py ~/tasks/t.py

    sudo cp ./brightness-sudoer /etc/sudoers.d/brightness
    sudo cp ./upspin.service /etc/systemd/system/upspin.service
}

function installMac {
    git submodule init
    git submodule update
    link ./.zshrc ~/.zshrc
    link ./mac.bash_aliases ~/.aliases
    link ./.emacs.d/ ~/.emacs.d/
    link ./.spacemacs ~/.spacemacs

    mkdir -p ~/tasks
    link ./t.py ~/tasks/t.py
    link ./.gitconfig ~/.gitconfig

    brew install wallpaper
}

install$machine
