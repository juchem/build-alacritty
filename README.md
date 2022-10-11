A self-contained, sandboxed docker image that will build and install the
[alacritty](https://github.com/alacritty/alacritty) terminal emulator, without
the need to setup a `rust` developer environment, install unwanted packages in
your machine or clutter it with build artifacts.

**TL;DR**: install alacritty under `~/opt` with (change `OUT_DIR` accordingly):
```
OUT_DIR="$HOME/opt"
VERSION=v0.10.1
mkdir -p "${OUT_DIR}"
docker run -it --rm -v "${OUT_DIR}:/out" -e "VERSION=${VERSION}" bstlang/build-alacritty
unset OUT_DIR
```

The source code for this image can be found at [juchem/build-alacritty](https://github.com/juchem/build-alacritty).

A pre-built image can be found in [docker
hub](https://hub.docker.com/r/bstlang/build-alacritty). Note that when using
the pre-built image there's **no need** to clone this repository. The
repository is only needed when building the image itself.

Binaries will be installed into guest directory `/out`. Mount that directory
with `-v host_dir:/out` to install it into some host directory.

Choose the version to build by setting environment variable `VERSION` to the
appropriate [revision tag](https://github.com/alacritty/alacritty/releases)
(defaults to `HEAD` for bleeding edge).

Example:
```
docker run -it --rm -v /usr/local:/out bstlang/build-alacritty
```
