#!/bin/bash

sed -i s/hdfs-namenode/$NAMENODE/ $HADOOP_HOME/etc/hadoop/core-site.xml

echo "aalocaht"
echo $NAMENODE
echo $MASTER
echo $SERVICE


export MASTERV=master
export WORKERV=worker

if [ "$SERVICE" == "$MASTERV" ] ; then 
	spark-class org.apache.spark.deploy.master.Master
fi

if [ "$SERVICE" == "$WORKERV" ] ; then
	echo spark-class org.apache.spark.deploy.worker.Worker spark://$MASTER:7077
	spark-class org.apache.spark.deploy.worker.Worker spark://$MASTER:7077
fi


