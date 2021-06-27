#!/bin/bash

set -e

RED_HOME="/root/.local/share/Red-DiscordBot/data"
BOT_HOME="${RED_HOME}/${BOT_NAME}"

# redbot not set up yet
if [ ! -d "$BOT_HOME" ]; then
    echo "[+] Setting up the bot $BOT_NAME for the first time..." >&2

    # Setup redbot server steps:
    # Bot name selection
    # Bot home dir
    # confirm bot home dir
    # select JSON backend

    { \
        echo "$BOT_NAME"; \
        echo "$BOT_HOME"; \
        echo "Y"; \
        echo "1"; \
    } | redbot-setup
fi

echo "[+] Starting $BOT_NAME..." >&2
redbot $BOT_NAME --no-prompt --prefix $PREFIX
