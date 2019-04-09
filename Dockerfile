FROM alpine

LABEL MAINTAINER "Coder <code@brosy.com>"

ENV VERSION=1.0.36
ENV APP_DIR /app
ENV WORKDIR $APP_DIR

# install php plus dep
RUN apk add --no-cache \
	php \
	php-session \
	php-curl \
	composer \
	git

RUN set -eux; \
	mkdir -p "$WORKDIR";

RUN cd $WORKDIR && git clone https://github.com/Art-of-WiFi/UniFi-API-browser.git .

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "|| sh"]


