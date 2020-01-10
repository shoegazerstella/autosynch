FROM python:3.7.4-slim-buster

MAINTAINER M. Stella Tavella mstella.tavella@gmail.com

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils

RUN apt-get install -y --no-install-recommends \
    build-essential \
    pkg-config \
    curl \
    unzip \
    supervisor \
    tzdata \
    cron \
    git

RUN apt-get update && apt-get install libgomp1 libsndfile1 -y

RUN apt-get install portaudio19-dev python-pyaudio -y

RUN apt-get install youtube-dl -y

RUN apt-get install sox -y

COPY requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

WORKDIR /root

RUN mkdir src

COPY . src

WORKDIR /root/src

ENTRYPOINT ["bash"]