FROM ubuntu:16.04

MAINTAINER jiamingjxu@gmail.com

ENV LANG C.UTF-8

WORKDIR /setup

COPY . /setup

RUN apt-get update

RUN apt-get install -y python-pip libpq-dev python-dev

RUN apt-get install -y git

RUN git clone https://github.com/studioml/studio.git

RUN pip install studioml -U

EXPOSE 80

ENV NAME World

WORKDIR studio

RUN python setup.py build

RUN python setup.py install

