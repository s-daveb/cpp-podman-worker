#!/bin/sh

image_name="$(cat image_name)"
version="$(cat currentversion)"

extra_opts="${extra_opts}"

podman build ${extra_opts} -t ${image_name}:${version} .
podman build ${extra_opts} -t ${image_name}:latest .
