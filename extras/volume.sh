vol="$(pactl get-sink-volume @DEFAULT_SINK@ | grep 'Volume' | awk -F'/' '{print $2}')"
vol2="${vol:2:-1}"
if [ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ]
then
    echo "${vol2}(M)"
else
    echo "${vol2}"
fi
