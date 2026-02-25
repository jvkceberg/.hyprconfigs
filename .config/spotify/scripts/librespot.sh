#!/usr/bin/env bash

NAME="librespot"
DEVICE_TYPE="computer"
BITRATE="160"
BACKEND="alsa"
MIXER="softvol"
DEVICE="default"
VOLUME_CTRL="log"

librespot \
  --name "$NAME" \
  --device-type "$DEVICE_TYPE" \
  --bitrate "$BITRATE" \
  --backend "$BACKEND"\
  --device "$DEVICE" \
  --mixer "$MIXER" \
  --volume-ctrl "$VOLUME_CTRL"

EXIT_CODE = $?
if [ $EXIT_CODE -ne 0 ]; then
  notify-send -u critical "Spotify Error" "Librespot terminated unexpectedly with exit code $EXIT_CODE."
fi
