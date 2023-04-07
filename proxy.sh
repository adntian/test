#!/usr/bin/env bash
set -e

if [ -z $1 ]; then
  echo '请输入端口'
  echo '********************************************************************************'
  echo '格式为./proxy.sh port username password'
  echo 'prot        端口'
  echo 'username    用户名'
  echo 'password    密码'
  echo '********************************************************************************'
  exit
fi
if [ -z $2 ]; then
  echo '请输入用户名'
  exit
fi
if [ -z $3 ]; then
  echo '请输入密码'
  exit
fi

wget http://ftp.barfooze.de/pub/sabotage/tarballs/microsocks-1.0.3.tar.xz
tar -xf microsocks-1.0.3.tar.xz && cd microsocks-1.0.3 && sudo apt install -y gcc make && make && sudo make install
nohup sudo microsocks -1 -i 0.0.0.0 -p $1 -u $2 -P $3 &

