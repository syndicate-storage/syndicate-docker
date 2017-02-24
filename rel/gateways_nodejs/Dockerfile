# Syndicate gateways for node.js
#
# VERSION	1.0

FROM	syndicate-gateways
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# syndicate node.js
##############################################
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

###### syndicate-node
RUN npm install -g syndicate-drive \
                   syndicate-drive-ug-tools

USER $USER
###### syndicate-ug-http
RUN npm install express node-cache express-ipfilter range_check multer node-uuid \
                async-lock mkdirp restler minimist async user-info

RUN wget -O syndicate-ug-http.zip https://github.com/syndicate-storage/syndicate-ug-http/archive/master.zip && \
    unzip syndicate-ug-http.zip && mv syndicate-ug-http-master syndicate-ug-http && \
    rm syndicate-ug-http.zip

RUN npm link syndicate-drive
