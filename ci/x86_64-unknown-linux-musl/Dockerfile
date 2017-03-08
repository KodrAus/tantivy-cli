FROM japaric/x86_64-unknown-linux-musl:v0.1.9

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		liblz4-dev \
		libcurl4-openssl-dev \
		libelf-dev \
		libdw-dev \
		binutils-dev

ENV CC=musl-gcc