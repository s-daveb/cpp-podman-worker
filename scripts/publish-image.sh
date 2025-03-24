#!/bin/sh

image_name="$(cat image_name)"
version="$(cat currentversion)"

podman push localhost/${image_name}:${version} localhost:5000/${image_name}:${version}
podman push localhost/${image_name}:${version} localhost:5000/${image_name}:latest
