# Syndicate gateways for Hadoop
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

include(`common_head.m4')

include(`tools.m4')

include(`syndicate-core.m4')

include(`syndicate-ag.m4')
include(`syndicate-ug.m4')

include(`syndicate-node.m4')
include(`syndicate-hadoop.m4')

USER syndicate
WORKDIR $HOME

ADD hadoop_conf $HOME/hadoop_conf
ADD hadoop_conf $HOME/hadoop_conf

ENV HADOOP_CONF_DIR $HOME/hadoop_conf

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)

ifdef(`DEF_UG_HTTP_PORT',
expose DEF_UG_HTTP_PORT,
expose 8888
)
