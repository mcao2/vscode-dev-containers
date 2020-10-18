# [Choice] Debian / Ubuntu version: debian-10, debian-9
ARG VARIANT=bionic
FROM registry.mxcao.me/vscode/devcontainers/base:${VARIANT}

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && \
    apt-get -y install build-essential \
    cmake \
    cppcheck \
    valgrind \
    clang-8 \
    clang-format-8 \
    clang-tidy-8 \
    lldb \
    gdb \
    llvm \
    doxygen \
    git \
    g++-7 \
    unzip \
    zip \
    zsh \
    apt-transport-https \
    pkg-config \
    python3-pip \
    zlib1g-dev && \
    pip3 install --upgrade pip && \
    pip3 install cpplint && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# https://stackoverflow.com/a/48672750/4548096
RUN ln -sf $(find /usr/lib -name perf | grep generic/perf) /usr/bin/perf

# Generate and update locale
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Allow no password sudo access for sudo group
RUN sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'
