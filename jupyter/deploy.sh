https://github.com/bgruening/docker-jupyter-notebook


docker build -t corlin/jupyter .
docker tag  corlin/jupyter  corlin/jupyter:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker push  corlin/jupyter
docker push  corlin/jupyter:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker rmi  corlin/jupyter:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker rmi  corlin/jupyter

docker pull  corlin/jupyter:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker run \
    --rm \
    --name=jupyter \
    --publish 8888:8888 \
    corlin/jupyter:latest

docker exec -it cb8ca3d77934 /bin/bash