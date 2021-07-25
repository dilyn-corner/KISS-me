#!/bin/sh -e

/usr/bin/chromium \
    --use-gl=egl \
    --ozone-platform=wayland \
    --enable-gpu-rasterization \
    --enable-features=UseOzonePlatform \
    --enable-features=VaapiVideoDecoder \
    --disable-gpu-memory-buffer-video-frames
