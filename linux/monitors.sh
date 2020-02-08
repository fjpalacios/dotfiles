#!/bin/sh

case "$1" in
    1)
        mons -o
        feh --bg-scale "${HOME}/Pictures/Wallpapers/wallpaper.jpg"
        ;;
    2)
        mons -e right
        feh --bg-scale "${HOME}/Pictures/Wallpapers/wallpaper.jpg" \
            --bg-scale "${HOME}/Pictures/Wallpapers/wallpaper.jpg"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
