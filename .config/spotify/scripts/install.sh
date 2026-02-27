#!/usr/bin/env bash

HYPRLAND=~/.config/hypr
SPOTIFY=~/.config/spotify/
NCSPOT=~/.config/ncspot

# Hyprland
mkdir -p $HYPRLAND/configs/
cd $HYPRLAND/configs/
ln -s $SPOTIFY/configs/hyprland.conf spotify.conf
echo 'source = "configs/spotify.conf"' >> $HYPRLAND/hyprland.conf

# Ncspot
mkdir -p $NCSPOT

if [ -f ${NCSPOT}/config.toml ]; then
  mv $NCSPOT/config.toml $NCSPOT/config.toml.bak
fi

cd $NCSPOT
ln -s $SPOTIFY/configs/ncspot.toml config.toml
