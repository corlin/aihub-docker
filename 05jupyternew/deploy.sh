

docker build -t corlin/jupyter .
docker tag  corlin/jupyter  corlin/jupyter:miniforge4.10.0.0-pyalink1.4.0-xgboost1.1.1
#docker tag  corlin/jupyter:miniforge4.10.0.0-pyalink1.4.0-xgboost1.1.1 corlin/jupyter
docker push  corlin/jupyter
docker push  corlin/jupyter:miniforge4.10.0.0-pyalink1.4.0-xgboost1.1.1
docker rmi  corlin/jupyter corlin/jupyter:miniforge4.10.0.0-pyalink1.4.0-xgboost1.1.1
docker rmi  corlin/jupyter

 docker save corlin/jupyter:miniforge4.10.0.0-pyalink1.4.0-xgboost1.1.1 > /data/jupyter0.2.tar

docker run \
        --rm -p 8888:8888 \
        -e JUPYTER_ENABLE_LAB=yes \
        -v "${PWD}":/home/jovyan/work \
        corlin/jupyter:latest