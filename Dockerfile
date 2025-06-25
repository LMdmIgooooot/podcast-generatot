# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.10 \
#     python3-pip \
#     git

# RUN pip install pyyaml

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    curl \
    git \
    build-essential

# Install pip for Python 3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Install PyYAML using Python 3.10
RUN python3.10 -m pip install pyyaml

# Copy files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
