FROM ubuntu:bionic
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \ 
	build-essential \
	cmake \
	libgtest-dev
	
# Build GTest library
RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
