
alias locker='docker run --rm -v "$(pwd)":/workdir -w /workdir -it -e TERM=$TERM'
alias vlocker='locker -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/tmp/.Xauthority -e DISPLAY=$DISPLAY -e XAUTHORITY=/tmp/.Xauthority'
alias wallpapergen="wallgen -c ffffff -font-file '$HOME/.fonts/Roboto-Bold.ttf' -t 'λx.x' -o /tmp/wallpaper.png && feh --bg-scale /tmp/wallpaper.png && i3-palette /tmp/wallpaper.png && i3-msg restart"