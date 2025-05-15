FROM ubuntu:22.04.5

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y curl bash openssh-client ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install sshx
RUN curl -sSf https://sshx.io/get | sh

# Start sshx when the container runs
CMD ["bash", "-c", "sshx"]
