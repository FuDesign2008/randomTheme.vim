#!/usr/bin/env sh

MAC_FONT_DIR=$HOME/Library/Fonts/
LINUX_FONT_DIR=/usr/share/fonts/truetype/

if [ -d "$MAC_FONT_DIR" ]; then
    cp ./fonts/**/*.ttf "$MAC_FONT_DIR"
elif [ -d "$LINUX_FONT_DIR" ]; then
    cp ./fonts/**/*.ttf "$LINUX_FONT_DIR"
else
    echo "System font directory does not exist"
fi
