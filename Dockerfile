# Build docker with
# docker build -t docker-kvs-build .
# docker run -it --rm docker-kvs-build
#
FROM amazonlinux:latest

ENV USER kvs
ENV PASSWD kvs

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
	sudo \
	xz && \
	wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz && \
    tar zxvf cmake-3.* && \
    rm cmake-3.12.3.tar.gz && \
    cd cmake-3.12.3/ && \
    ./bootstrap && \
    make -j4 && \
    make install

RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -G wheel -u 1000 ${USER} && \
echo "${USER}:${PASSWD}" | chpasswd
USER ${USER}
WORKDIR /home/${USER}