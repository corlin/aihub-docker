docker login

docker build -t corlin/py-flink .
docker tag  corlin/py-flink  corlin/py-flink:py_3.8-java8-flink11.13.1-scala2.11
docker push  corlin/py-flink
docker push  corlin/py-flink:py_3.8-java8-flink11.13.1-scala2.11
docker rmi  corlin/py-flink:py_3.8-java8-flink11.13.1-scala2.11
docker rmi  corlin/py-flink
#https://ci.apache.org/projects/flink/flink-docs-master/docs/deployment/resource-providers/standalone/docker/

FLINK_PROPERTIES="jobmanager.rpc.address: jobmanager"
docker network create flink-network

docker run \
    --rm \
    --name=jobmanager \
    --network flink-network \
    --publish 8081:8081 \
    --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
    corlin/py-flink:latest jobmanager

docker run \
    --rm \
    --name=taskmanager \
    --network flink-network \
    --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
    corlin/py-flink:latest taskmanager




https://www.cnblogs.com/xhyan/p/6593075.html