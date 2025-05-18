FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl wget python3 ca-certificates && \
    apt clean

# Download and install sshx directly
RUN curl -sSf https://sshx.io/get | sh
RUN sshx
