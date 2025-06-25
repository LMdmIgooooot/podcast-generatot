FROM ubuntu:latest

# Install Python 3.10, pip, and required build tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    curl \
    git \
    build-essential

# Use pip3.10 explicitly to install packages
RUN python3.10 -m pip install --upgrade pip && \
    python3.10 -m pip install pyyaml

# Copy files into container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
