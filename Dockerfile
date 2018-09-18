FROM ubuntu:xenial
RUN apt-get update && apt-get install -y --no-install-recommends \ 
	cmake \ 
	gnuplot-x11 \
