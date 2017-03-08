FROM japaric/x86_64-unknown-linux-musl:v0.1.9

ENV CC=gcc-4.8
ENV CXX=g++-4.8

RUN apt-get install -y python-software-properties && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		liblz4-dev \
		gcc-4.8 \
		g++-4.8 \
		libcurl4-openssl-dev \
		libelf-dev \
		libdw-dev \
		binutils-dev