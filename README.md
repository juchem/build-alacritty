A self-contained, sandboxed docker image that will build and install the
[alacritty](https://github.com/alacritty/alacritty) terminal emulator, without
the need to setup a `rust` developer environment, install unwanted packages in
your machine or clutter it with build artifacts.

**TL;DR**: install alacritty under `/usr/local`
```
docker run -it --rm -v /usr/local:/out bstlang/build-alacritty
```

A pre-built image can be found in [docker
hub](https://hub.docker.com/r/bstlang/build-alacritty).

Binaries will be installed into guest directory `/out`. Mount that directory
with `-v host_dir:/out` to install it into some host directory.

Choose the version to build by setting environment variable `VERSION` to the
appropriate [revision tag](https://github.com/alacritty/alacritty/releases).

Example:
```
docker run -it --rm -v /usr/local:/out -e VERSION=HEAD bstlang/build-alacritty
```
