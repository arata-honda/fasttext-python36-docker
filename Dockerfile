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
        curl \
        file \
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

# mecabのインストール
WORKDIR /usr/src/mecab/
RUN mkdir -p /temp/mecab_src/ && \
git clone https://github.com/taku910/mecab.git  /temp/mecab_src/ && \
mv -f /temp/mecab_src/mecab/* /usr/src/mecab/ && \
 ./configure  --enable-utf8-only && \
make && \
make install && \
rm -rf  /temp/mecab_src/  && \
rm -rf  /usr/src/mecab/

# shared library cache を更新する
RUN ldconfig

# mecab-neologdのインストール用のdicディレクトリを作成
RUN mkdir -p /usr/local/lib/mecab/dic

# mecab-neologdのインストール
RUN git clone http://github.com/neologd/mecab-ipadic-neologd.git /usr/src/mecab-ipadic-neologd && \
/usr/src/mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y && \
rm -rf  /usr/src/mecab-ipadic-neologd && \
pip3.6 install mecab-python3

WORKDIR /
# fasttextのインストール
RUN git clone http://github.com/facebookresearch/fastText.git /tmp/fastText && \
  rm -rf /tmp/fastText/.git* && \
  mv /tmp/fastText/* / && \
  cd / && \
  make && \
  pip3.6 install cython && \
  pip3.6 install fasttext 

