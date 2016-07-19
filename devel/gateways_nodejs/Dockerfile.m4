# Syndicate gateways for node.js
#
# VERSION	1.0

FROM	syndicate-gateways
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root
WORKDIR $HOME

include(`syndicate-node.m4')

USER syndicate
WORKDIR $HOME

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)

ifdef(`DEF_UG_HTTP_PORT',
expose DEF_UG_HTTP_PORT,
expose 8888
)
