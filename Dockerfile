FROM python:3.8-slim

ENV RED_TOKEN=""
ENV PREFIX="!"

# Fix openjdk install
# https://github.com/debuerreotype/docker-debian-artifacts/issues/24#issuecomment-360870939
RUN mkdir -p /usr/share/man/man1

RUN apt-get update && apt-get install -y \
    git \
    openjdk-11-jre-headless \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

# Installing Red-DiscordBot
RUN pip3 install -U pip setuptools wheel
RUN pip3 install -U Red-DiscordBot

# Exposes volumes
VOLUME ["/root/.local/share/Red-DiscordBot"]
VOLUME ["/root/.config/Red-DiscordBot"]

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
