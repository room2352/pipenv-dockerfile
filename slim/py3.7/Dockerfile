FROM python:3.7-slim

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
# Python, don't write bytecode!
ENV PYTHONDONTWRITEBYTECODE 1

# -- Install Pipenv:
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl

RUN apt-get clean

RUN curl --silent https://bootstrap.pypa.io/get-pip.py | python3.7

# Backwards compatility.
RUN rm -fr /usr/local/bin/python3 && ln /usr/local/bin/python3.7 /usr/local/bin/python3

RUN pip3 install pipenv

# -- Install Application into container:
RUN set -ex && mkdir /app

WORKDIR /app

# -- Install additional packages:
ONBUILD COPY packages.in packages.in
ONBUILD RUN apt-get update && cat packages.in | xargs apt-get install -y --no-install-recommends
ONBUILD RUN apt-get clean

# -- Adding Pipfiles
ONBUILD COPY Pipfile Pipfile
ONBUILD COPY Pipfile.lock Pipfile.lock

# -- Install dependencies:
ONBUILD RUN set -ex && pipenv install --deploy --system

# --------------------
# - Using This File: -
# --------------------

# FROM room2352/pipenv:py3.7-slim-nodev

# COPY . /app

# -- Replace with the correct path to your app's main executable
# CMD python3 main.py
