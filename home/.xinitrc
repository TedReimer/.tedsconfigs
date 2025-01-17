xset -dpms
xset s off
exec picom --vsync --backend glx &
exec slstatus &
exec kanata -c /home/ted/.tedsconfigs/extras/keymap.kbd &
exec primes run &
exec dwm
