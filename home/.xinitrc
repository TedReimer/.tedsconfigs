xset -dpms
xset s off
exec xrandr --output eDP-1 --mode 2048x1152 &
exec xinput disable 11 &
exec xrandr --output DP-1 --pos 2048x0 &
exec picom --vsync --backend glx &
exec slstatus &
exec go run /home/ted/Documents/programming/julia/julia.go &
exec feh --bg-fill /home/ted/Documents/programming/julia/set.png &
exec dwm
