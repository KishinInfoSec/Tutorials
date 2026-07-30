FROM python:3.13-trixie

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    vim \
    git \
    python3-pip \
    tmux \
    build-essential

RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN groupadd -r user && useradd -r -g user user

RUN mkdir -p /home/user && chown user:user /home/user

ENTRYPOINT [ "/bin/bash" ]

ENV HOME=/home/user