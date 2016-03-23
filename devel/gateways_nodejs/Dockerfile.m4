# Syndicate gateways for node.js
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

include(`common_head.m4')

include(`tools.m4')

include(`syndicate-core.m4')

include(`syndicate-ag.m4')
include(`syndicate-ug.m4')

##############################################
# node.js
##############################################
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

USER syndicate
WORKDIR $HOME

RUN npm install ffi ref ref-struct ref-array

RUN wget -O libsyndicate-node.js.zip https://github.com/syndicate-storage/libsyndicate-node.js/archive/master.zip
RUN unzip libsyndicate-node.js.zip
RUN mv libsyndicate-node.js-master libsyndicate-node.js

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)

