##############################################
# Hadoop
##############################################
RUN apt-get install -y openjdk-7-jdk ant

USER syndicate
WORKDIR $HOME

###### Hadoop
RUN wget -O hadoop-0.20.2-cdh3u5.tar.gz http://archive.cloudera.com/cdh/3/hadoop-0.20.2-cdh3u5.tar.gz
RUN tar zxvf hadoop-0.20.2-cdh3u5.tar.gz
RUN mv hadoop-0.20.2-cdh3u5 hadoop

RUN mkdir /home/syndicate/hdfs_data

# H-Syndicate
RUN wget -O h-syndicate.zip https://github.com/syndicate-storage/H-Syndicate/archive/master.zip
RUN unzip h-syndicate.zip
RUN mv H-Syndicate-master h-syndicate

WORKDIR "h-syndicate"
RUN ant
# output = dist/H-Syndicate.jar
# libs = libs/

# Configure
ADD hadoop_conf/*.sh /home/syndicate/hadoop/conf
ADD hadoop_conf/*.xml /home/syndicate/hadoop/conf
ADD hadoop_conf/masters /home/syndicate/hadoop/conf
ADD hadoop_conf/slaves /home/syndicate/hadoop/conf

USER root
WORKDIR $HOME

