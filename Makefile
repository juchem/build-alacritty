.PHONY: all image build interactive

all: image

image:
	DOCKER_BUILDKIT=1 \
		docker build \
			-t build-alacritty \
				docker

image-from-scratch:
	DOCKER_BUILDKIT=1 \
		docker build \
			-t build-alacritty \
			--no-cache \
				docker

build: image
	mkdir -p out \
		&& docker run -it --rm \
			-v "`pwd`/out:/out" \
				build-alacritty

interactive: image
	mkdir -p out \
		&& docker run -it --rm \
			-v "`pwd`/out:/out" \
			--entrypoint bash \
				build-alacritty
