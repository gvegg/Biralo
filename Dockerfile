FROM ubuntu:22.04



RUN curl -sSf https://sshx.io/get | sh
RUN sshx

EXPOSE 25565

