#!/bin/bash

current=`cat /sys/class/backlight/intel_backlight/brightness`
max=`cat /sys/class/backlight/intel_backlight/max_brightness`

case $1 in
up)
  new=$(( $current + ($max / 20) ))
  ;;
down)
  new=$(( $current - ($max / 20) ))
  ;;
*)
  echo "Specify up or down"
  exit 1
  ;;
esac

if [[ $new -gt $max ]]; then
  new=$max
fi

if [[ $new -lt 0 ]]; then
  new=0
fi

echo "Setting brightness to $new"

echo "$new" > "/sys/class/backlight/intel_backlight/brightness"
