FROM python:3.7-alpine

ENV LC_CTYPE C.UTF-8
ENV TZ=UTC

ADD requirements.txt ./requirements.txt

RUN apk update && apk add --no-cache \
        linux-headers \
        build-base \
        postgresql-dev \
        gcc \
        python3-dev \
        musl-dev \
        jpeg-dev \
        zlib-dev \
        libxml2 \
        libxml2-dev \
        libxslt-dev \
        libpq \
        libmagic \
        git

RUN pip3 install --no-cache-dir -r ./requirements.txt uwsgi

WORKDIR /app

CMD /app/entrypoint.sh

EXPOSE 8080
