# fasttext-python36-docker

# 環境
```
ubuntu 16.04
python 3.6
```
上記の環境に[fasttext](https://github.com/facebookresearch/fastText/tree/master/python)を入れています。

# 使い方

1. Docker-for〇〇のインストール
  - [MACの場合](https://www.docker.com/docker-mac)
  - [Windowsの場合](https://www.docker.com/docker-windows)

2. リポジトリクローン
```
mkdir docker-fasttext(任意)
cd docker-fasttext
git clone https://github.com/arata-honda/fasttext-python36-docker.git
cd fasttext-python36-Docker
docker build .
docker run -it イメージ番号
```
