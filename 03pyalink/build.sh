docker login

docker build -t corlin/pyalink .
docker tag  corlin/pyalink  corlin/pyalink:py3-pyalink1.4.0-java8-flink11.13.1-scala2.11
docker tag  corlin/pyalink  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11
docker push  corlin/pyalink
docker push  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11
docker rmi  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11
docker rmi  corlin/pyalink


https://mirror.tuna.tsinghua.edu.cn/help/pypi/

docker pull  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11

FLINK_PROPERTIES="jobmanager.rpc.address: jobmanager"
docker network create flink-network

docker run \
    --rm \
    --name=jobmanager \
    --network flink-network \
    --publish 8081:8081 \
    --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
    corlin/pyalink:latest jobmanager

docker run \
    --rm \
    --name=taskmanager1 \
    --network flink-network \
    --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
    corlin/pyalink:latest taskmanager
docker ps|grep pyalink
docker exec -it c0916e0935a0 /bin/bash