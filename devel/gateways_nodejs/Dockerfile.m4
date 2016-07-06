# Syndicate gateways for node.js
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

include(`common_head.m4')

include(`tools.m4')

include(`syndicate-core.m4')

include(`syndicate-ag-rg.m4')
include(`syndicate-ug.m4')

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
