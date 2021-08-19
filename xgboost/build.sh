

docker build -t corlin/pyalink .
docker tag  corlin/pyalink  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker push  corlin/pyalink
docker push  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker rmi  corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
docker rmi  corlin/pyalink

# 扩容
https://www.htcp.net/5012.html
https://jingyan.baidu.com/article/cbf0e500a9731e2eab289371.html