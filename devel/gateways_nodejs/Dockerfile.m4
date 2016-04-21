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

RUN npm install ffi ref ref-struct ref-array async express node-cache

# syndicate-node
RUN wget -O syndicate-node.zip https://github.com/syndicate-storage/syndicate-node/archive/master.zip
RUN unzip syndicate-node.zip
RUN mv syndicate-node-master syndicate-node

# install syndicate-node
RUN npm install ./syndicate-node

# syndicate-node-ug-tools
RUN wget -O syndicate-node-ug-tools.zip https://github.com/syndicate-storage/syndicate-node-ug-tools/archive/master.zip
RUN unzip syndicate-node-ug-tools.zip
RUN mv syndicate-node-ug-tools-master syndicate-node-ug-tools

# syndicate-ug-http
RUN wget -O syndicate-ug-http.zip https://github.com/syndicate-storage/syndicate-ug-http/archive/master.zip
RUN unzip syndicate-ug-http.zip
RUN mv syndicate-ug-http-master syndicate-ug-http

ifdef(`DEF_GATEWAY_PORT',
expose DEF_GATEWAY_PORT,
expose 31111
)

ifdef(`DEF_UG_HTTP_PORT',
expose DEF_UG_HTTP_PORT,
expose 8888
)

