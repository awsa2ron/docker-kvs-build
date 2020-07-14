# Build docker with
# docker build -t kinesis-video-producer-sdk-c-amazon-linux .
#
FROM amazonlinux:latest

RUN yum install -y \
	autoconf \
	automake  \
	bison \
	bzip2 \
	cmake \
	curl \
	diffutils \
	flex \
	gcc \
	gcc-c++ \
	git \
	gmp-devel \
	gstreamer* \
	libcurl-devel \
	libffi \
	libffi-devel \
	libmpc-devel \
	libtool \
	make \
	m4 \
	mpfr-devel \
	pkgconfig \
	vim \
	wget \
	xz && \
	wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz && \
    tar zxvf cmake-3.* && \
    rm cmake-3.12.3.tar.gz && \
    cd cmake-3.12.3/ && \
    ./bootstrap && \
    make -j4 && \
    make install

#WORKDIR /opt/
#RUN git clone --recursive https://github.com/awslabs/amazon-kinesis-video-streams-producer-c.git
#WORKDIR /opt/amazon-kinesis-video-streams-producer-sdk-c/build/
#RUN cmake .. && make 
