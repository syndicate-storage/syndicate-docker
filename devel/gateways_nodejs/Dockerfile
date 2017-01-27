# Syndicate gateways for node.js
#
# VERSION	1.0

FROM	syndicate-gateways-dev
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# syndicate node.js
##############################################
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

USER $USER

###### syndicate-node
RUN npm install ffi ref ref-struct ref-union ref-array async express node-cache express-ipfilter range_check async-lock

# syndicate-node
RUN wget -O syndicate-node.zip https://github.com/syndicate-storage/syndicate-node/archive/master.zip && \
    unzip syndicate-node.zip && mv syndicate-node-master syndicate-node

# install syndicate-node
RUN npm install ./syndicate-node

# syndicate-node-ug-tools
RUN wget -O syndicate-node-ug-tools.zip https://github.com/syndicate-storage/syndicate-node-ug-tools/archive/master.zip && \
    unzip syndicate-node-ug-tools.zip && mv syndicate-node-ug-tools-master syndicate-node-ug-tools

# syndicate-ug-http
RUN wget -O syndicate-ug-http.zip https://github.com/syndicate-storage/syndicate-ug-http/archive/master.zip && \
    unzip syndicate-ug-http.zip && mv syndicate-ug-http-master syndicate-ug-http
