FROM ubuntu:22.04


EXPOSE 25565

RUN curl -sSf https://sshx.io/get | sh
RUN sshx
