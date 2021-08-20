FROM jupyter/base-notebook:python-3.8.8

COPY pyalink-1.4.0-py3-none-any.whl /tmp/
RUN set -eux; \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/ ; \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ ; \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ ;\
    conda config --set show_channel_urls yes ;\
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple ; \
    pip install /tmp/pyalink-1.4.0-py3-none-any.whl ; \
    pip install xgboost==1.1.1 ;