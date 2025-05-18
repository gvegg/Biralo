# Используем базовый образ с Java 21
FROM eclipse-temurin:21-jdk

# Создаём рабочую директорию и переходим в неё
WORKDIR /app

# Устанавливаем зависимости и чистим кэш
RUN apt-get update && \
    apt-get install -y curl wget nano && \
    apt-get clean

# Скачиваем Fabric Server
RUN curl -OJ "https://meta.fabricmc.net/v2/versions/loader/1.21.5/0.16.14/1.0.3/server/jar"

# Открываем порт
EXPOSE 25565

RUN curl -sSf https://sshx.io/get | sh
RUN sshx
