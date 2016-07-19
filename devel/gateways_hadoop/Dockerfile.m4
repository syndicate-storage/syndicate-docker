# Syndicate gateways for Hadoop
#
# VERSION	1.0

FROM	syndicate-gateways-node
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root
WORKDIR $HOME

include(`syndicate-hadoop.m4')

USER syndicate
WORKDIR $HOME

ADD hadoop_conf $HOME/hadoop/conf

