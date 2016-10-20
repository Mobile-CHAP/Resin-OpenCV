FROM resin/raspberrypi3-python:latest

MAINTAINER Dominic Cassidy <dominic.cassidy@postgrad.plymouth.ac.uk>

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
	apt-get install -y cmake
	
RUN git clone https://github.com/itseez/opencv.git /usr/local/src/opencv 

RUN cd /usr/local/src/opencv && \
mkdir release && cd release && \
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

RUN cd /usr/local/src/opencv/release && \
make && make install

rm -rf /usr/local/src/opencv \
	&& apt-get purge -y cmake \
	&& apt-get autoremove -y --purge

ENV LD_LIBRARY_PATH /usr/local/lib
