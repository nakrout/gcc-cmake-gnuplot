FROM ubuntu:bionic
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \ 
	build-essential \
	cmake \
	git \
	libgtest-dev
	
# Build GTest library
RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
    
# Install Mosquitto Broker
RUN apt-get install mosquitto -y
# Install the Clients: Mosquitto clients help us easily test MQTT through a command line utility
RUN apt-get install mosquitto-clients -y
# Install OpenSSL: Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols
RUN apt-get install libssl-dev -y

RUN git clone https://github.com/eclipse/paho.mqtt.c && cd paho.mqtt.c && make && make install && cd .. && rm -rf paho.mqtt.c
