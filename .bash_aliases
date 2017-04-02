
alias locker='docker run --rm -v "$(pwd)":/workdir -w /workdir -it'
alias vlocker='locker -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/tmp/.Xauthority -e DISPLAY=$DISPLAY -e XAUTHORITY=/tmp/.Xauthority'
alias wallpapergen='wallgen -t "λx.x" -o /tmp/wallpaper.png && feh --bg-scale /tmp/wallpaper.png'
