# Use Ubuntu as the base image
FROM ubuntu:22.04

# Set non-interactive mode for apt to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git bash curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the freeroot repository
RUN git clone https://github.com/foxytouxxx/freeroot.git

# Set working directory to the cloned repo
WORKDIR /freeroot

# Ensure the script has execution permissions
RUN chmod +x root.sh

# Run the script when the container starts
CMD ["bash", "root.sh"]
