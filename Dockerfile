FROM resin/raspberrypi3-python:latest

MAINTAINER Dominic Cassidy <dominic.cassidy@postgrad.plymouth.ac.uk>

ENV OPENCV_VERSION 3.1.0

COPY build.sh /build.sh
RUN bash /build.sh \
	&& rm /build.sh

ENV LD_LIBRARY_PATH /usr/local/lib
