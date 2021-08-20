FROM corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11
COPY *.jar /opt/flink/lib/
RUN set -eux; \
    chown -R flink:flink /opt/flink/lib/* ; \
    # pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple ; \
    # 1.1.1
    pip install xgboost==1.1.1 ;