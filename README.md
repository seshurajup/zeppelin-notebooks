# Setup Apache Spark, ElasticSearch, hadoop & Zeppelin on Mac with Brew
### Install brew, java, python, scala

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install java
brew install python
brew install scala
```

### Hadoop: Install & Configuration

```sh
brew install hadoop

vim 
/usr/local/Cellar/hadoop/3.1.0/libexec/etc/hadoop/core-site.xml
<configuration>
<property>
<name>fs.default.name</name>
<value>hdfs://localhost:5555</value>
</property>
</configuration>
vim /usr/local/Cellar/hadoop/3.1.0/libexec/etc/hadoop/hdfs-site.xml
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
vim /usr/local/Cellar/hadoop/3.1.0/libexec/etc/hadoop/mapred-site.xml
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
</configuration>
vim /usr/local/Cellar/hadoop/3.1.0/libexec/etc/hadoop/yarn-site.xml
<configuration>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
</configuration>
hadoop namenode -format
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
vim ~/.bashrc
hadoop-start
port : 9870
```

### Apache Spark: Install & Configuration
```sh
brew install apache-spark
cd /usr/local/Cellar/apache-spark/<version>/libexec/conf
cp spark-env.sh.template spark-env.sh
modify spark master web ui port to 8888

vim /usr
# - SPARK_MASTER_PORT / SPARK_MASTER_WEBUI_PORT, to use non-default ports for the master
SPARK_MASTER_PORT=7777
SPARK_MASTER_WEBUI_PORT=8888
vim .bashrc
export PATH="/usr/local/Cellar/apache-spark/<version>/libexec/sbin/:$PATH"
start-master.sh
ui-port: 8888
master-port: 7777
``` 
### Elasticsearch: Install & Configuration
```
brew install elasticsearch
vim /usr/local/etc/elasticsearch/elasticsearch.yml
brew services restart elasticsearch
port: 9200
Zeppelin Notebooks: Install & Configuration

brew install apache-zeppelin
cp /usr/local/Cellar/apache-zeppelin/0.8.0/libexec/conf/zeppelin-site.xml.template /usr/local/Cellar/apache-zeppelin/0.8.0/libexec/conf/zeppelin-site.xml
vim /usr/local/Cellar/apache-zeppelin/0.8.0/libexec/conf/zeppelin-site.xml
<name>zeppelin.server.port</name>
<value>9999</value>
zeppelin-daemon.sh
port: 9999
```

### Zeppelin: Install & Configuration
```sh
brew install apache-zeppelin
```
#### settings - spark
```sh
Add SPARK_HOME= "	/usr/local/Cellar/apache-spark/<version>/libexec/"
master = spark://<system>:7777
zeppelin.pyspark.python = /usr/local/bin/python3
```
#### settings - elasticsearch
```sh
elasticsearch.port = 9200
```

### Start & Stop services
```sh
chmod +x services.sh
sh services.sh start
sh services.sh stop
```