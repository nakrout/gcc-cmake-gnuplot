FROM ubuntu:bionic
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \ 
	build-essential \
	cmake \
	wget \
	openssh-client \
	unzip \
	libgtest-dev \
	mosquitto \
	mosquitto-clients \
	libssl-dev \
	python3-setuptools \
	python3-pip \
	python3-pytest

# Install Python3 packages for Integration Tests
RUN pip3 install -U pytest
#RUN  export PYTHONIOENCODING=UTF-8 && export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8 && export LANGUAGE=en_US.UTF-8 && pip3 install pytest-play==2.0.2
#RUN pip3 install play-mqtt paho-mqtt

# Build GTest library for Unit Tests 
RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
    
# Install Paho
RUN wget --no-check-certificate https://github.com/eclipse/paho.mqtt.c/archive/refs/tags/v1.3.8.zip && \
	unzip v1.3.8.zip && rm -r v1.3.8.zip && \
	cd paho.mqtt.c-1.3.8 && make && make install && cd .. && rm -rf paho.mqtt.c-1.3.8

# Install mongo-c-driver
RUN wget --no-check-certificate https://github.com/mongodb/mongo-c-driver/releases/download/1.17.1/mongo-c-driver-1.17.1.tar.gz && \
	tar xzf mongo-c-driver-1.17.1.tar.gz && rm -rf mongo-c-driver-1.17.1.tar.gz && \
	cd mongo-c-driver-1.17.1 && \
	mkdir cmake-build && cd cmake-build && cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
	cmake --build . && cmake --build . --target install && \
	cd ../.. && rm -rf mongo-c-driver-1.17.1
