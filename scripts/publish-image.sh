#!/bin/sh


version="$(cat currentversion)"

podman push  mybuildbot:${version} localhost:5000/mybuildbot:${version}
podman push  mybuildbot:${version} localhost:5000/mybuildbot:latest
