#!/bin/bash -xe

git fetch --depth=1 origin "${VERSION}"
git checkout -b "build-${VERSION}" FETCH_HEAD
git clean -xfd

cargo build --release
cargo install builds --root /out
