# syndicate-docker-gateways-nodejs-dev
#
# VERSION	1.0

FROM	syndicate-docker-gateways-dev
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# syndicate node.js
##############################################
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    nodejs && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log

USER $USER

###### syndicate-node
RUN wget -O syndicate-node.zip https://github.com/syndicate-storage/syndicate-node/archive/master.zip && \
    unzip syndicate-node.zip && mv syndicate-node-master syndicate-node

RUN npm install ./syndicate-node

###### syndicate-node-ug-tools
RUN wget -O syndicate-node-ug-tools.zip https://github.com/syndicate-storage/syndicate-node-ug-tools/archive/master.zip && \
    unzip syndicate-node-ug-tools.zip && mv syndicate-node-ug-tools-master syndicate-node-ug-tools

RUN npm install ./syndicate-node-ug-tools

###### syndicate-ug-http
RUN wget -O syndicate-ug-http.zip https://github.com/syndicate-storage/syndicate-ug-http/archive/master.zip && \
    unzip syndicate-ug-http.zip && mv syndicate-ug-http-master syndicate-ug-http
    
WORKDIR $HOME/syndicate-ug-http/server
RUN npm install .
WORKDIR $HOME/syndicate-ug-http/cli
RUN npm install .

WORKDIR $HOME
