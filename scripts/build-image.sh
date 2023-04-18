#!/bin/sh

podman build -t mybuildbot:$(cat currentversion) .
podman build -t mybuildbot:latest .
