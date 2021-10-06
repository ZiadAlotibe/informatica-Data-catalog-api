FROM python:3.10.0-alpine3.14

COPY requirements.txt /informatica-catalog-api/requirements.txt

RUN /sbin/apk add --no-cache libpq libxslt
RUN /usr/local/bin/pip install --no-cache-dir --requirement /informatica-catalog-api/requirements.txt

ENV VERSION="2020.5" \
    PYTHONUNBUFFERED="1" \
    TZ="Etc/UTC"

LABEL org.opencontainers.image.authors="Ziad <ZiadAlotaibi@informatica.com>" \
      org.opencontainers.image.version="${VERSION}"

COPY get-catalog-statistics.py /informatica-catalog-api/get-catalog-statistics.py
