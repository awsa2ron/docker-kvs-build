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
	unzip \
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

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz && \
	tar xvf gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz && \
	rm gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz && \
	mv gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf /opt/ && \
	export PATH=$PATH:/opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin

RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -G wheel -u 1000 ${USER} && \
echo "${USER}:${PASSWD}" | chpasswd
USER ${USER}
WORKDIR /home/${USER}

# install aws CLI version 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install