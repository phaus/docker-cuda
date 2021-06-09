FROM debian:bullseye-slim

LABEL maintainer="Ozzy Johnson <docker@ozzy.io>"
LABEL maintainer="Philipp Haußleiter <philipp@haussleiter.de>"

ENV DEBIAN_FRONTEND noninteractive

ENV CUDA_DRIVER 460.84
ENV CUDA_INSTALL https://de.download.nvidia.com/XFree86/Linux-x86_64/${CUDA_DRIVER}/NVIDIA-Linux-x86_64-${CUDA_DRIVER}.run

# Update and install minimal.
RUN \
  apt-get update \
            --quiet \
  && apt-get install \
            --yes \
            --no-install-recommends \
            --no-install-suggests \
       build-essential \
       kmod \
       wget \
       ca-certificates \
# Clean up packages.
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install CUDA.
RUN wget \
      $CUDA_INSTALL \
        -P /tmp \
        --no-verbose \
      && chmod +x /tmp/NVIDIA-Linux-x86_64-${CUDA_DRIVER}.run \
      && /tmp/NVIDIA-Linux-x86_64-${CUDA_DRIVER}.run \
        -s \
        -N \
        --no-kernel-module \
      && rm -rf /tmp/*

# Default command.
ENTRYPOINT ["/bin/bash"]
