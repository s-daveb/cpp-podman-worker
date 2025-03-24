FROM docker.io/archlinux:latest
MAINTAINER S. David

USER root
WORKDIR /root

RUN /bin/echo "SigLevel = Never" >> /etc/pacman.conf
#RUN pacman-key --init
RUN pacman -Syu --noconfirm

ENV BUILDMASTER="buildbutt"
ENV BUILDMASTER_PORT=9989
ENV WORKERNAME="autoconf-podman-worker"
ENV WORKERPASS="password"

ENV WORKER_DESCRIPTION=""

RUN yes | pacman -Sy archlinux-keyring
RUN yes | pacman -S buildbot-worker autoconf automake make gcc git boost boost-libs sdl2 sdl2_image sdl2_gfx which vim pkgconf nlohmann-json libtool cmake ccache dhclient catch2 net-tools
RUN yes | pacman -S qt6-base qt6-tools qt6-5compat

RUN /usr/bin/sed -i 's/SigLevel = Never/#SigLevel = Never/g' /etc/pacman.conf

USER buildbot
WORKDIR /var/lib/buildbot

RUN buildbot-worker create-worker /var/lib/buildbot ${BUILDMASTER}:${BUILDMASTER_PORT} ${WORKERNAME} ${WORKERPASS}

COPY buildbot.tac /var/lib/buildbot
COPY info /var/lib/buildbot/info

CMD ["buildbot-worker", "start", "--nodaemon"]

# vim: set ft=dockerfile :
