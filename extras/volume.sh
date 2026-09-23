#!/bin/bash
# Prints the current Master volume as "##%" or "##%(M)" if muted.

output=$(amixer sget Master)

# Extract the first percentage value, e.g. "72%"
vol=$(echo "$output" | grep -oP '\d+%' | head -n1)

# Extract mute status: [on] or [off] appears after the percentage
mute_status=$(echo "$output" | grep -oP '\[(on|off)\]' | head -n1)

if [ "$mute_status" = "[off]" ]; then
    echo "${vol}(M)"
else
    echo "${vol}"
fi
