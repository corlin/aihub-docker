FROM python:3.8-buster
# 更新为清华源
ADD sources.list /etc/apt/
# set -eux 执行方式修改，打印命令，失败退出
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		p11-kit \
	; \
	rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/local/openjdk-8
RUN { echo '#/bin/sh'; echo 'echo "$JAVA_HOME"'; } > /usr/local/bin/docker-java-home && chmod +x /usr/local/bin/docker-java-home && [ "$JAVA_HOME" = "$(docker-java-home)" ] # backwards compatibility
ENV PATH $JAVA_HOME/bin:$PATH

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# https://adoptopenjdk.net/upstream.html
ENV JAVA_VERSION 8u302
# https://github.com/docker-library/openjdk/issues/320#issuecomment-494050246

RUN set -eux; \
	\
	arch="$(dpkg --print-architecture)"; \
	downloadUrl='https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u302-b08/OpenJDK8U-jdk_x64_linux_8u302b08.tar.gz'; \
	wget --progress=dot:giga -O openjdk.tgz "$downloadUrl"; \
	wget --progress=dot:giga -O openjdk.tgz.asc "$downloadUrl.sign"; \
	\
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver keyserver.ubuntu.com --recv-keys EAC843EBD3EFDB98CC772FADA5CD6035332FA671; \
	gpg --batch --keyserver keyserver.ubuntu.com --keyserver-options no-self-sigs-only --recv-keys CA5F11C6CE22644D42C6AC4492EF8D39DC13168F; \
	gpg --batch --list-sigs --keyid-format 0xLONG CA5F11C6CE22644D42C6AC4492EF8D39DC13168F \
		| tee /dev/stderr \
		| grep '0xA5CD6035332FA671' \
		| grep 'Andrew Haley'; \
	gpg --batch --verify openjdk.tgz.asc openjdk.tgz; \
	gpgconf --kill all; \
	rm -rf "$GNUPGHOME"; \
	mkdir -p "$JAVA_HOME"; \
	tar --extract \
		--file openjdk.tgz \
		--directory "$JAVA_HOME" \
	; \
	rm openjdk.tgz*; \
	{ \
		echo '#!/usr/bin/env bash'; \
		echo 'set -Eeuo pipefail'; \
		echo 'trust extract --overwrite --format=java-cacerts --filter=ca-anchors --purpose=server-auth "$JAVA_HOME/jre/lib/security/cacerts"'; \
	} > /etc/ca-certificates/update.d/docker-openjdk; \
	#chmod +x /etc/ca-certificates/update.d/docker-openjdk; \
	#/etc/ca-certificates/update.d/docker-openjdk; \
	#find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf; \
	#ldconfig; \
# 冒烟测试
	javac -version; \
	java -version