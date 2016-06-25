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

RUN mkdir .ssh
RUN chmod 700 .ssh

ADD keys.pub $HOME/.ssh/
RUN cat .ssh/keys.pub >> .ssh/authorized_keys
RUN chmod 600 .ssh/authorized_keys

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)

ifdef(`DEF_UG_HTTP_PORT',
expose DEF_UG_HTTP_PORT,
expose 8888
)

