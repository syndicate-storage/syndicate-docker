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

# H-Syndicate
RUN wget -O h-syndicate.zip https://github.com/syndicate-storage/H-Syndicate/archive/master.zip
RUN unzip h-syndicate.zip
RUN mv H-Syndicate-master h-syndicate
WORKDIR "h-syndicate"

USER root
WORKDIR $HOME

