FROM ghcr.io/containerpak/mesa64:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/parsec"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libasound2t64 libavcodec62 libcurl4t64 libgl1 libjpeg8 \
    libpng16-16t64 libsm6 libssl3t64 libstdc++6 libudev1 \
    libx11-6 libxcursor1 libxi6 && \
    cpak-clean-junk

COPY parsec.desktop /usr/share/applications/parsec.desktop
COPY icon.png /usr/share/icons/hicolor/128x128/apps/parsec.png
