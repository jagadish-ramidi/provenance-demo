FROM python:3.9.20

USER root

RUN apk add gcc g++ musl-dev libffi-dev build-base

WORKDIR /src
COPY . /src/pkgs

RUN pip3 install -r pkgs/requirements.txt
