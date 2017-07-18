

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


link ./.bashrc ~/.bashrc
link ./.bash_aliases ~/.bash_aliases
link ./.profile ~/.profile

link ./i3 ~/.config/i3
link ./i3status ~/.config/i3status
link ./compton.conf ~/.config/compton.conf

link ./.gitconfig ~/.gitconfig
