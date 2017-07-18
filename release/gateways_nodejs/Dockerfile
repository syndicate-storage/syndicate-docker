# syndicate-docker-gateways-nodejs
#
# VERSION	1.0

FROM	syndicate-docker-gateways
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# useful tools
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    curl unzip wget build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log

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
RUN npm install syndicate-storage \
                syndicate-storage-ug-tools

###### syndicate-ug-http
RUN wget -O syndicate-ug-http.zip https://github.com/syndicate-storage/syndicate-ug-http/archive/master.zip && \
    unzip syndicate-ug-http.zip && mv syndicate-ug-http-master syndicate-ug-http && \
    rm syndicate-ug-http.zip

WORKDIR $HOME/syndicate-ug-http/server
RUN npm install .
WORKDIR $HOME/syndicate-ug-http/cli
RUN npm install .

WORKDIR $HOME
