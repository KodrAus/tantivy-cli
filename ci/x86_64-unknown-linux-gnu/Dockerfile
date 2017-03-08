FROM japaric/x86_64-unknown-linux-gnu:v0.1.9

RUN apt-get install -y python-software-properties && \
	add-apt-repository ppa:ubuntu-toolchain-r/test && \
	add-apt-repository ppa:gezakovacs/lz4 && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		liblz4-dev \
		gcc-4.8 \
		g++-4.8 \
		libcurl4-openssl-dev \
		libelf-dev \
		libdw-dev \
		binutils-dev

ENV CC=gcc-4.8
ENV CXX=g++-4.8