FROM ubuntu:26.04 AS source

ADD --checksum=sha256:c8a4407713d72dcb1c59f082977e81e1b9e8ffd679d0666882cde4c8a0821dd2 https://builds.parsecgaming.com/package/parsec-linux.deb /stage/parsec.deb

FROM ghcr.io/containerpak/mesa64:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/parsec"

COPY --from=source /stage/parsec.deb /tmp/parsec.deb

RUN apt-get update && \
    apt-get install -y --no-install-recommends /tmp/parsec.deb && \
    cpak-clean-junk

COPY parsec.desktop /usr/share/applications/parsec.desktop
COPY icon.png /usr/share/icons/hicolor/128x128/apps/parsec.png

