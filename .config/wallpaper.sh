#!/bin/bash
wget "https://wp.rednetwork.xyz" -O $HOME/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/wallpaper.jpg"
