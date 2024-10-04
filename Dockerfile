# Stage 1: Build stage
FROM ubuntu:20.04 AS builder

# Set environment variables to force non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies, including Python 3 and CA certificates
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    cmake \
    ninja-build \
    build-essential \
    wget \
    python3 \
    python3-distutils \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install LLVM
# On my machine, the result of ninja -j$(nproc) was 16, it may cause really big crashes, so i recommend using between 2 an 8 proc
RUN git clone --depth 1 --branch llvmorg-14.0.6 https://github.com/llvm/llvm-project.git /llvm-project && \
    cd /llvm-project/llvm && \
    mkdir -p build && cd build && \
    cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=/opt/llvm .. && \
    ninja -j$(8) && \
    ninja install

# Install the obfuscator plugin
RUN git clone https://github.com/eshard/obfuscator-llvm.git /obfuscator-llvm && \
    cd /obfuscator-llvm && \
    mkdir -p build && cd build && \
    cmake -G "Ninja" -DLLVM_DIR=/opt/llvm/lib/cmake/llvm .. && \
    ninja -j$(8)

# Stage 2: Final stage
FROM ubuntu:20.04

# Set environment variables to force non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install runtime dependencies, including Python 3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        python3 \
        python3-distutils && \
        clang \
        nano \
    rm -rf /var/lib/apt/lists/*

# Copy LLVM and obfuscator from the build stage
COPY --from=builder /opt/llvm /opt/llvm
COPY --from=builder /obfuscator-llvm /opt/obfuscator-llvm

# Add LLVM binaries to PATH
ENV PATH="/opt/llvm/bin:${PATH}"

# Set entrypoint to /bin/bash for interactive use
ENTRYPOINT ["/bin/bash"]
