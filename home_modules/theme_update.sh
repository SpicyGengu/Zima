#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/image.jpg"
    exit 1
fi

file="$1"
CONFIG_FILE="/home/lovro/.config/hypr/hyprpaper.conf"

if [ ! -f "$file" ]; then
    echo "Error: File $file does not exist."
    exit 2
fi

# sed -i -E "s|^preload=.*|preload=${absolute_path}|" "$CONFIG_FILE"
# sed -i -E "s|^wallpaper=eDP-1,.*|wallpaper=eDP-1,${absolute_path}|" "$CONFIG_FILE"
sed -i -E "/wallpaper \{/,/\}/{s|^[[:space:]]*path = .*|    path = ${file}|}" "$CONFIG_FILE"

#hyprctl hyprpaper unload all
#hyprctl hyprpaper preload "$absolute_path"
hyprctl hyprpaper wallpaper "eDP-1,$file"
wal -i "$file"

echo "Wallpaper path updated successfully."
