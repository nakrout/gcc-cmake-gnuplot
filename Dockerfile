FROM ubuntu:bionic
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \ 
	build-essential \
	cmake \
	wget \
	unzip \
	libgtest-dev \
	mosquitto \
	mosquitto-clients \
	libssl-dev
	
# Build GTest library
RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
    
# Install Paho
RUN wget --no-check-certificate https://github.com/eclipse/paho.mqtt.c/archive/master.zip && \
	unzip master.zip && rm -r master.zip && \
	cd paho.mqtt.c-master && make && make install && cd .. && rm -rf paho.mqtt.c-master
