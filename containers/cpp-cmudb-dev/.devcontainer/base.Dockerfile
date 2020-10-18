# [Choice] Debian / Ubuntu version: debian-10, debian-9
ARG VARIANT=bionic
FROM registry.mxcao.me/vscode/devcontainers/base:${VARIANT}

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
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

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
