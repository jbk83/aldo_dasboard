# Dockerfile
FROM ruby:3.1.0

RUN wget -q -O /tmp/websocketd.zip \
    https://github.com/joewalnes/websocketd/releases/download/v0.2.9/websocketd-0.2.9-linux_amd64.zip \
    && unzip /tmp/websocketd.zip -d /tmp/websocketd && mv /tmp/websocketd/websocketd /usr/bin \
    && chmod +x /usr/bin/websocketd

RUN apt-get update -qq && apt-get install -y apt-utils nano

RUN mkdir /src
WORKDIR /src
COPY inventory.rb /src
EXPOSE 8080

CMD ["websocketd", "--port=8080", "ruby", "inventory.rb"]