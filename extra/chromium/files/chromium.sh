#!/bin/sh -e

/usr/lib/chromium/chromium \
    --use-gl=egl \
    --enable-skia-renderer \
    --ignore-gpu-blocklist \
    --ozone-platform=wayland \
    --enable-gpu-rasterization \
    --enable-features=UseOzonePlatform \
    --enable-features=VaapiVideoDecoder \
    --disable-gpu-memory-buffer-video-frames
