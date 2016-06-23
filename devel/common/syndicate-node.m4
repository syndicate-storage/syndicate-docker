##############################################
# syndicate
##############################################
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

USER syndicate
WORKDIR $HOME

###### syndicate-node
RUN npm install ffi ref ref-struct ref-array async express node-cache express-ipfilter range_check

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

USER root
WORKDIR $HOME

