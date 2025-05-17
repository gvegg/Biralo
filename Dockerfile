FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl wget python3 ca-certificates && \
    apt clean

# Install sshx
RUN curl -sSf https://sshx.io/get | sh

# Move sshx to a directory in PATH
RUN mv sshx /usr/local/bin/sshx && chmod +x /usr/local/bin/sshx

# Create a dummy web server directory
WORKDIR /app
RUN echo "SSHX session running..." > index.html

# Expose port 8080 to keep the container alive
EXPOSE 8080

# Start a dummy HTTP server and launch sshx
CMD python3 -m http.server 8080 & sshx serve --once
