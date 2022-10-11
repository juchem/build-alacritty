#!/bin/bash -e

build_alacritty() {
  apt-get update
  apt-get install --only-upgrade -y --no-install-recommends \
    cargo rustc

  git fetch --depth=1 origin "${VERSION}"
  git checkout -b "build-${VERSION}" FETCH_HEAD
  git clean -xfd

  cargo build --release
  cargo install alacritty --root /out "$@"
}

(set -x; build_alacritty "$@")

cat <<EOF

Alacritty ${VERSION} successfully built.

Customize it by editing '~/.alacritty.yml'.

A sample default config can be downloaded from 'https://raw.githubusercontent.com/alacritty/alacritty/${VERSION}/alacritty.yml'.
EOF
