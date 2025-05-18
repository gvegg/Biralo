FROM ubuntu:22.04


EXPOSE 25565

RUN apt install openjdk-21-jdk
RUN mkdir server
RUN cd server
RUN curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.21.5/0.16.14/1.0.3/server/jar

RUN curl -sSf https://sshx.io/get | sh
RUN sshx
