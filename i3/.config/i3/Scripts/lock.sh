#!/usr/bin/env bash

# Set the icon and temporary screenshot location
tmpbg='/tmp/screen.png'

# Take a screenshot
scrot "$tmpbg"

# Blur the screenshot
convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

# Overlay the lock icon onto the screenshot
# convert "$tmpbg" -gravity center -composite "$tmpbg"

# Lock the screen with the blurred screenshot
i3lock -i "$tmpbg"

