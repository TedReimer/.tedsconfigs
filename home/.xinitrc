xset -dpms
xset s off
exec xrandr --output eDP-1 --mode 2048x1152 &
exec xrandr --output DP-1 --pos 2048x0 &
exec picom --vsync &
exec slstatus &
exec kanata -c /home/ted/.tedsconfigs/extras/keymap.kbd &
exec dwm
