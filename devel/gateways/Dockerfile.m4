# Syndicate gateways
#
# VERSION	1.0

FROM	syndicate-core
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root
WORKDIR $HOME

include(`syndicate-ag-rg.m4')
include(`syndicate-ug.m4')

USER syndicate
WORKDIR $HOME

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)

