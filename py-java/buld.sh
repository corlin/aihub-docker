docker login

docker build -t corlin/py-java .
docker tag  corlin/py-java  corlin/py-java:python_3.8-openjava_8
docker push  corlin/py-java
docker push  corlin/py-java:python_3.8-openjava_8
docker rmi  corlin/py-java:python_3.8-openjava_8
docker rmi  corlin/py-java


apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
		fontconfig libfreetype6 \
		ca-certificates p11-kit \
		;