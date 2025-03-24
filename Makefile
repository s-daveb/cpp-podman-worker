.PHONY: publish build

all: docker-image

docker-image: currentversion
	sh scripts/build-image.sh

build: docker-image

publish: build
	sh scripts/publish-image.sh
