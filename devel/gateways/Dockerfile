# syndicate-docker-gateways-dev
#
# VERSION	1.0

FROM	syndicate-docker-base-dev
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

##############################################
# syndicate AG/RG/UG
##############################################
USER $USER
WORKDIR $HOME

###### syndicate-ag
RUN wget -O syndicate-ag.zip https://github.com/syndicate-storage/syndicate-ag/archive/master.zip && \
    unzip syndicate-ag.zip && mv syndicate-ag-master syndicate-ag
WORKDIR "syndicate-ag"

RUN make

USER root
RUN make install && ldconfig

USER $USER
WORKDIR $HOME

###### syndicate-rg
RUN wget -O syndicate-rg.zip https://github.com/syndicate-storage/syndicate-rg/archive/master.zip && \
    unzip syndicate-rg.zip && mv syndicate-rg-master syndicate-rg
WORKDIR "syndicate-rg"

RUN make

USER root
RUN make install && ldconfig

USER $USER
WORKDIR $HOME

###### syndicate-ug-tools
RUN wget -O syndicate-ug-tools.zip https://github.com/syndicate-storage/syndicate-ug-tools/archive/master.zip && \
    unzip syndicate-ug-tools.zip && mv syndicate-ug-tools-master syndicate-ug-tools
WORKDIR "syndicate-ug-tools"

RUN make

USER root
RUN make install && ldconfig

USER $USER
WORKDIR $HOME

###### syndicatefs (FUSE)
RUN wget -O syndicatefs.zip https://github.com/syndicate-storage/syndicatefs/archive/master.zip && \
    unzip syndicatefs.zip && mv syndicatefs-master syndicatefs
WORKDIR "syndicatefs"

RUN make

USER root
RUN make install && ldconfig

WORKDIR $HOME

###### syndicate-fs-driver dependencies
USER root
RUN pip install pika pyinotify expiringdict boto3 ftputil

USER $USER

# install python-irodsclient from github
RUN wget -O python-irodsclient.zip https://github.com/iychoi/python-irodsclient/archive/master.zip && \
    unzip python-irodsclient.zip && mv python-irodsclient-master python-irodsclient
WORKDIR "python-irodsclient"

USER root
RUN python setup.py install

WORKDIR $HOME
USER $USER

###### syndicate-filesystem-driver
RUN wget -O syndicate-fs-driver.zip https://github.com/syndicate-storage/syndicate-fs-driver/archive/master.zip && \
    unzip syndicate-fs-driver.zip && mv syndicate-fs-driver-master syndicate-fs-driver
WORKDIR "syndicate-fs-driver"

USER root
# need to ignore warnings (setuptools is too old)
RUN python -W ignore setup.py install

USER $USER
WORKDIR $HOME
