#!/bin/bash -e

build_version="${VERSION:-HEAD}"

build_alacritty() {
  apt-get update
  apt-get install --only-upgrade -y --no-install-recommends \
    cargo rustc

  git fetch --depth=1 origin "${build_version}"
  git checkout -b "build-${build_version}" FETCH_HEAD
  git clean -xfd

  time cargo build --release
  time cargo install alacritty --root /out --force "$@"
}

(set -x; build_alacritty "$@")

cat <<EOF

Alacritty ${build_version} successfully built.

Customize it by editing '~/.alacritty.yml'.

A sample default config can be downloaded from 'https://raw.githubusercontent.com/alacritty/alacritty/${build_version}/alacritty.yml'.
EOF
