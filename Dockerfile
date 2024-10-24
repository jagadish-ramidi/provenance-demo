FROM artifactory.dev.adskengineer.net/cloudos-community/alpine/python311:latest

ARG PIP_INDEX_URL=https://art-toucan.autodesk.com/artifactory/api/pypi/autodesk-pypi-virtual/simple

USER root

RUN apk add gcc g++ musl-dev libffi-dev build-base

WORKDIR /src
COPY . /src/pkgs

RUN pip3 install -r pkgs/requirements.txt
