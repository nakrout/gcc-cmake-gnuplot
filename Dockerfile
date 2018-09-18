FROM ubuntu:xenial
RUN apt-get update && apt-get install -y --no-install-recommends \ 
	build-essential \
	cmake \ 
	gnuplot-x11
