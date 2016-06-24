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

WORKDIR $HOME

RUN cp /home/syndicate/h-syndicate/dist/H-Syndicate.jar /home/syndicate/hadoop/lib

RUN wget -O /home/syndicate/hadoop/lib/commons-collections4-4.0.jar http://central.maven.org/maven2/org/apache/commons/commons-collections4/4.0/commons-collections4-4.0.jar
RUN wget -O /home/syndicate/hadoop/lib/jersey-client-1.8.jar http://central.maven.org/maven2/com/sun/jersey/jersey-client/1.8/jersey-client-1.8.jar
RUN wget -O /home/syndicate/hadoop/lib/jackson-jaxrs-1.5.2.jar http://central.maven.org/maven2/org/codehaus/jackson/jackson-jaxrs/1.5.2/jackson-jaxrs-1.5.2.jar
RUN wget -O /home/syndicate/hadoop/lib/jackson-xc-1.5.2.jar http://central.maven.org/maven2/org/codehaus/jackson/jackson-xc/1.5.2/jackson-xc-1.5.2.jar

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV HADOOP_HOME /home/syndicate/hadoop


USER root
WORKDIR $HOME

