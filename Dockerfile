FROM docker.io/buildbot/buildbot-worker:latest
MAINTAINER S. David

USER root
WORKDIR /

CMD apt update
CMD apt install libsdl2-dev nlohmann-json3-dev catch qtbase5-dev

CMD unlink /bin/sh
CMD ln -s /usr/bin/bash /bin/sh

USER buildbot
COPY buildbot.tac /buildbot/buildbot.tac
WORKDIR /buildbot
CMD ["/usr/bin/dumb-init", "twistd", "--pidfile=", "-ny", "buildbot.tac"]
