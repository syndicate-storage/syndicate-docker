# Syndicate gateways for R
#
# VERSION	1.0

FROM	syndicate-gateways
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root
WORKDIR $HOME

include(`syndicate-r.m4')

USER syndicate
WORKDIR $HOME

##############################################
# Setup CRAN repository
##############################################
ADD Rprofile $HOME/.Rprofile

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)
