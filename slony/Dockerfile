FROM postgres:10-alpine

RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
		bison \
		coreutils \
		dpkg-dev dpkg \
		flex \
		gcc \
		krb5-dev \
		libc-dev \
		libedit-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		openldap-dev \
		openssl-dev \
		perl-dev \
		perl-ipc-run \
		perl-utils \
		python3-dev \
		tcl-dev \
		util-linux-dev \
		zlib-dev \
		icu-dev \
		nano \
		vim \
	; \
    \
    wget -O /root/slony.tar.bz2 "https://www.slony.info/downloads/2.2/source/slony1-2.2.9.tar.bz2"; \
    cd /root; \
    tar xvf slony.tar.bz2; \
    rm slony.tar.bz2; \
    cd slony1-2.2.9; \
    ./configure --with-pgbindir=/usr/local/bin/ \
    ; \
    make -j "$(nproc)"; \
    make install; \
	\

