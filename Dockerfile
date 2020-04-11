# -----------------------------------------------------------------------------
# docker-ansible
#
# Builds a lightweight docker image that can run ansible / ansible-lint / molecule
# (http://ansible.com/).
#
# Author: Aranya Sen (https://github.com/senaranya)
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------

FROM python:3-alpine
LABEL maintainer="Aranya Sen"

RUN apk --no-cache update && apk --no-cache upgrade
RUN apk add --no-cache musl-dev
RUN apk add --no-cache libffi-dev
RUN apk add --no-cache openssl-dev
RUN apk add --no-cache --update  \
    --virtual .build-deps \
    make \
    gcc \
    python3-dev \
    && pip install --upgrade pip \
    && pip install --no-cache-dir --upgrade ansible ansible-lint yamllint molecule flake8 "python-dotenv[cli]"\
    && apk del .build-deps

CMD ["--help"]
