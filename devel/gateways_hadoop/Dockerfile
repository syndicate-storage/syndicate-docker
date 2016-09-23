# Syndicate gateways for Hadoop
#
# VERSION	1.0

FROM	syndicate-gateways-node
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# Hadoop
##############################################
RUN apt-get install -y openjdk-7-jdk ant

USER $USER

###### Hadoop
RUN wget -O hadoop-0.20.2-cdh3u5.tar.gz http://archive.cloudera.com/cdh/3/hadoop-0.20.2-cdh3u5.tar.gz && \
    tar zxvf hadoop-0.20.2-cdh3u5.tar.gz && mv hadoop-0.20.2-cdh3u5 hadoop

# H-Syndicate
RUN wget -O h-syndicate.zip https://github.com/syndicate-storage/H-Syndicate/archive/master.zip && \
    unzip h-syndicate.zip && mv H-Syndicate-master h-syndicate

WORKDIR "h-syndicate"
RUN ant

WORKDIR $HOME

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV HADOOP_HOME $HOME/hadoop
ENV HADOOP_PREFIX $HOME/hadoop
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_HDFS_HOME $HADOOP_PREFIX
ENV HADOOP_MAPRED_HOME $HADOOP_PREFIX
ENV HADOOP_YARN_HOME $HADOOP_PREFIX
ENV PATH $HADOOP_PREFIX/bin:$PATH

RUN cp $HOME/h-syndicate/dist/H-Syndicate.jar $HADOOP_HOME/lib && \
    wget -O $HADOOP_HOME/lib/commons-collections4-4.0.jar http://central.maven.org/maven2/org/apache/commons/commons-collections4/4.0/commons-collections4-4.0.jar && \
    wget -O $HADOOP_HOME/lib/jersey-client-1.8.jar http://central.maven.org/maven2/com/sun/jersey/jersey-client/1.8/jersey-client-1.8.jar && \
    wget -O $HADOOP_HOME/lib/jackson-jaxrs-1.5.2.jar http://central.maven.org/maven2/org/codehaus/jackson/jackson-jaxrs/1.5.2/jackson-jaxrs-1.5.2.jar && \
    wget -O $HADOOP_HOME/lib/jackson-xc-1.5.2.jar http://central.maven.org/maven2/org/codehaus/jackson/jackson-xc/1.5.2/jackson-xc-1.5.2.jar && \
    wget -O $HADOOP_HOME/lib/guava-11.0.2.jar http://central.maven.org/maven2/com/google/guava/guava/11.0.2/guava-11.0.2.jar && \
    wget -O $HADOOP_HOME/lib/jersey-apache-client4-1.8.jar http://central.maven.org/maven2/com/sun/jersey/contribs/jersey-apache-client4/1.8/jersey-apache-client4-1.8.jar && \
    wget -O $HADOOP_HOME/lib/httpclient-4.1.1.jar http://central.maven.org/maven2/org/apache/httpcomponents/httpclient/4.1.1/httpclient-4.1.1.jar && \
    wget -O $HADOOP_HOME/lib/httpcore-4.1.1.jar http://central.maven.org/maven2/org/apache/httpcomponents/httpcore/4.1.1/httpcore-4.1.1.jar

ADD hadoop_conf $HOME/hadoop/conf
