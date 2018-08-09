#!/bin/zsh
# Hadoop service
/usr/local/Cellar/hadoop/<version>/libexec/sbin/$1-all.sh
# Elasticsearch service
brew services $1 elasticsearch

# Apache spark service
$1-all.sh

# zeppelin service
zeppelin-daemon.sh $1
