
function resetwallpaper {
    wallpaper "/Library/Desktop Pictures/Color Burst 2.jpg"
    sleep 1
    wallpaper $1
}

alias locker='docker run --rm -v "$(pwd)":/workdir -w /workdir -it -e TERM=$TERM'
alias wallpapergen="wallgen -w 2560 -h 1600 -c ffffff -font-size 240 -font-file '$HOME/.fonts/Roboto-Bold.ttf' -t 'λx.x' -o ~/Documents/wallpaper.png && resetwallpaper ~/Documents/wallpaper.png"
alias t='python ~/tasks/t.py --task-dir ~/tasks --list tasks'