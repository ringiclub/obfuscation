# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables to force non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies, including Python 3
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    ninja-build \
    build-essential \
    wget \
    python3 \
    python3-distutils \
    && rm -rf /var/lib/apt/lists/*

# Install LLVM
RUN git clone --depth 1 --branch llvmorg-14.0.6 https://github.com/llvm/llvm-project.git /llvm-project \
    && cd /llvm-project/llvm \
    && mkdir -p build && cd build \
    && cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=/opt/llvm .. \
    && ninja -j$(nproc) \
    && ninja install

# Add LLVM binaries to PATH
ENV PATH="/opt/llvm/bin:${PATH}"

# Install the obfuscator plugin
RUN git clone https://github.com/eshard/obfuscator-llvm.git /obfuscator-llvm \
    && cd /obfuscator-llvm \
    && mkdir -p build && cd build \
    && cmake -G "Ninja" -DLLVM_DIR=/opt/llvm/lib/cmake/llvm .. \
    && ninja -j$(nproc)

# Set entrypoint to /bin/bash for interactive use
ENTRYPOINT ["/bin/bash"]