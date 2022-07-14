FROM bitnami/minideb:unstable

ENV VERSION="HEAD"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  ca-certificates \
  libfreetype6-dev \
  libfontconfig1-dev \
  libxcb-xfixes0-dev \
  libxkbcommon-dev \
  git \
  pkg-config \
  python3 \
  cmake \
  cargo

RUN apt autoremove --purge -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

ENV REPO_DIR="/src/alacritty"
RUN mkdir -p "${REPO_DIR}"
WORKDIR "${REPO_DIR}"

RUN git init
RUN git remote add origin "https://github.com/alacritty/alacritty.git"

COPY entrypoint.sh /srv
ENTRYPOINT "/srv/entrypoint.sh"
