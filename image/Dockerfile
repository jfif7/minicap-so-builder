# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk

# RUN curl https://storage.googleapis.com/git-repo-downloads/repo \
#     -o /usr/local/bin/repo && chmod +x /usr/local/bin/repo

ADD repo /usr/local/bin/

RUN chmod +x /usr/local/bin/repo

RUN git config --global user.email "aosp-builder@example.com" && \
    git config --global user.name "AOSP builder"

VOLUME /aosp /mirror /app /artifacts

WORKDIR /aosp

ADD aosp.sh /usr/local/bin/

RUN ln -s /usr/local/bin/aosp.sh /aosp.sh

# CMD ["/aosp.sh" "--help"]

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]
