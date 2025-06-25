FROM ubuntu:latest

# Install Python 3.10, pip, and required build tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    curl \
    git \
    build-essential

# Ensure pip is installed for Python 3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Use pip3.10 explicitly to install packages
RUN python3.10 -m pip install --upgrade pip && \
    python3.10 -m pip install pyyaml

# Copy files into container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
