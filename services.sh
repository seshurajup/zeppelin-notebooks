#!/bin/zsh

# Hadoop service
/usr/local/Cellar/hadoop/3.1.0/libexec/sbin/$1-all.sh
# Elasticsearch service
brew services $1 elasticsearch

# Apache spark service
$1-all.sh

# zeppelin service
zeppelin-daemon.sh $1
