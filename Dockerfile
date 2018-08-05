FROM ubuntu:16.04
MAINTAINER Arata Honda <arata.honda@excite.jp>

# 必要最低限のモジュールインストール
RUN apt-get update && apt-get install -y \
        build-essential \
        wget \
        gcc \
        git \
        unzip \
        zlib1g-dev \
        libssl-dev \
        && rm -rf /var/cache/apk/*

# python3.6のインストール
WORKDIR /root/
RUN wget http://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz \
        && tar zxf Python-3.6.0.tgz \
        && cd Python-3.6.0 \
        && ./configure \
        && make\
        && make altinstall
ENV PYTHONIOENCODING "utf-8"

WORKDIR /


# fasttextのインストール
RUN git clone https://github.com/facebookresearch/fastText.git /tmp/fastText && \
  rm -rf /tmp/fastText/.git* && \
  mv /tmp/fastText/* / && \
  cd / && \
  make && \
  pip3.6 install cython && \
  pip3.6 install fasttext 

#WORKDIR /

