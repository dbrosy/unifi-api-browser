FROM alpine

LABEL MAINTAINER "Coder <code@brosy.com>"

COPY /files .

ENV APP_DIR /app
ENV WORKDIR $APP_DIR

RUN set -eux; \
  mkdir -p "$WORKDIR" \
  && cd $WORKDIR

# install php plus dep
RUN apk update \
  && apk add --no-cache php php-session php-curl php-tokenizer composer git \
  && git clone --depth 1 https://github.com/Art-of-WiFi/UniFi-API-browser.git \
  && apk del git \
  && chmod +x start.sh	

# Define environment variable
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG C.UTF-8
ENV TZ Australia/Sydney
ENV USER your unifi username
ENV PASSWORD your unifi password
ENV UNIFIURL https://192.168.1.1
ENV PORT 8443
ENV DISPLAYNAME My Site Name
ENV APIBROWSERUSER admin
ENV APIBROWSERPASS SHA512 hash of the password

EXPOSE 8000/tcp

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/app"]


