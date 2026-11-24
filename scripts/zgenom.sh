#!/usr/bin/env bash

# Install or update zgenom, the maintained fork of zgen
# https://github.com/jandamm/zgenom

URL=https://github.com/jandamm/zgenom.git
REPO="$HOME/.zgenom"

if [ ! -d "$REPO" ]; then
    git clone "$URL" "$REPO"
else
    cd "$REPO" || exit
    git pull
fi
