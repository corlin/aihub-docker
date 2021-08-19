FROM corlin/pyalink:py3-pyalink1.4.0-java8-flink1.13.1-scala2.11-xgboost1.1.1
COPY nb.sh /
RUN set -eux; \
    chmod a+x /nb.sh ; \
    mkdir /workdir ;
    # pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple ; \
    # 1.1.1
    #pip install xgboost==1.1.1 ; \

WORKDIR /workdir
ENTRYPOINT ["/nb.sh"]
EXPOSE 8888
CMD ["help"]