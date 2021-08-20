FROM python:3.8-buster
# 更新为清华源
COPY sources.list /etc/apt/
COPY openjdk.tgz /root/
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
	#pwd; \
    #whoami; \
    #id ; \
    #apt-get install mlocate -y; \
    #updatedb; \
    #locate openjdk.tgz; \
    ls /root/ ; \
	ls /root/openjdk.tgz; \
    arch="$(dpkg --print-architecture)"; \
	#downloadUrl='https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u302-b08/OpenJDK8U-jdk_x64_linux_8u302b08.tar.gz'; \
	mkdir -p "$JAVA_HOME"; \
    ls "$JAVA_HOME"; \
	tar --extract \
		--file /root/openjdk.tgz  \
        --strip-components 1 \
		--directory "$JAVA_HOME" \
	; \
    ls "$JAVA_HOME"; \
	rm /root/openjdk.tgz; \
    env; \
    ls -ltr /usr/local/openjdk-8/bin;\
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