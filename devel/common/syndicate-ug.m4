##############################################
# syndicate
##############################################
USER syndicate

###### syndicate-ug-tools
RUN wget -O syndicate-ug-tools.zip https://github.com/syndicate-storage/syndicate-ug-tools/archive/master.zip && \
    unzip syndicate-ug-tools.zip && mv syndicate-ug-tools-master syndicate-ug-tools
WORKDIR "syndicate-ug-tools"

RUN make

USER root
RUN make install && ldconfig

WORKDIR $HOME

