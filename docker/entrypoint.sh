#!/bin/bash -e

build_version="${ALACRITTY_VERSION:-HEAD}"

build_alacritty() {
  apt-get update
  apt-get install --only-upgrade -y --no-install-recommends \
    cargo rustc

  git fetch --depth=1 origin "${build_version}"
  git checkout -b "build-${build_version}" FETCH_HEAD
  git clean -xfd

  time cargo build --release
  strip --strip-all target/release/alacritty
  mkdir -p /out/bin
  cp -f target/release/alacritty /out/bin/alacritty
}

(set -x; build_alacritty "$@")

cat <<EOF

Alacritty ${build_version} successfully built.

Customize it by editing '~/.alacritty.yml'.

A sample default config can be downloaded from 'https://raw.githubusercontent.com/alacritty/alacritty/${build_version}/alacritty.yml'.
EOF
