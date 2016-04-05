##############################################
# syndicate
##############################################
USER syndicate
WORKDIR $HOME

###### syndicate-ug-tools
RUN wget -O syndicate-ug-tools.zip https://github.com/syndicate-storage/syndicate-ug-tools/archive/master.zip
RUN unzip syndicate-ug-tools.zip
RUN mv syndicate-ug-tools-master syndicate-ug-tools
WORKDIR "syndicate-ug-tools"

RUN make

USER root
RUN make install
RUN ldconfig

WORKDIR $HOME

