FROM alpine:latest
ENV TZ Asia/Seoul
RUN apk update && \
    apk add --no-cache tzdata \
    php81 \
    php81-curl \
    php81-dom \
    php81-tokenizer \
    php81-xmlwriter \
    php81-xml \
    composer \
    git && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    cd /opt && \
    git clone https://github.com/hitrov/oci-arm-host-capacity.git && \
    cd /opt/oci-arm-host-capacity && \
    composer install && \
    apk del git && \
    rm /var/cache/apk/*
EXPOSE 80

