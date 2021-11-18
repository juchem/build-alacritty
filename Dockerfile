FROM bitnami/minideb:unstable

ENV VERSION="v0.9.0"

RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends libfreetype6-dev
RUN apt-get install -y --no-install-recommends libfontconfig1-dev
RUN apt-get install -y --no-install-recommends libxcb-xfixes0-dev
RUN apt-get install -y --no-install-recommends libxkbcommon-dev
RUN apt-get install -y --no-install-recommends git
RUN apt-get install -y --no-install-recommends pkg-config
RUN apt-get install -y --no-install-recommends python3
RUN apt-get install -y --no-install-recommends cmake
RUN apt-get install -y --no-install-recommends cargo

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
