FROM ubuntu:22.04

# Install required packages
RUN apt update && \
    apt install -y curl wget unzip git python3 ca-certificates && \
    apt clean

# Corrected SSHX binary install (v0.4.2)
RUN curl -L https://github.com/sshxio/sshx/releases/download/v0.4.2/sshx-linux-amd64 -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Dummy web server to keep Render container alive
WORKDIR /app
RUN echo "SSHX session running..." > index.html

EXPOSE 8080

# Run dummy server and SSHX together
CMD python3 -m http.server 8080 & /usr/local/bin/sshx serve --once

