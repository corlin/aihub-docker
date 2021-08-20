FROM corlin/py-flink:py_3.8-java8-flink11.13.1-scala2.11
COPY pyalink-1.4.0-py3-none-any.whl /tmp/
RUN set -eux; \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple ; \
  pip install /tmp/pyalink-1.4.0-py3-none-any.whl ;