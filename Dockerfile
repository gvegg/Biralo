FROM ubuntu:22.04

RUN apt update && \
    apt install -y curl wget nano openjdk-21-jdk && \
    apt clean

RUN curl -sSf https://sshx.io/get | sh
RUN sshx

RUN mkdir server
RUN cd server
RUN curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.21.5/0.16.14/1.0.3/server/jar

EXPOSE 25565

