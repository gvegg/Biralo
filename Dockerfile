FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl wget unzip git python3 ca-certificates && \
    apt clean

# Download and install SSHX (v0.4.2)
RUN curl -L https://github.com/sshxio/sshx/releases/download/v0.4.2/sshx-linux-amd64 -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Create dummy web server content
WORKDIR /app
RUN echo "SSHX session active..." > index.html

EXPOSE 8080

# Run dummy server + sshx
CMD python3 -m http.server 8080 & sshx serve --once
