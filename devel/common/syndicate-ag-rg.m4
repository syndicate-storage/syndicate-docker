##############################################
# syndicate
##############################################
RUN pip install pika pyinotify expiringdict
#retrying timeout_decorator 

USER syndicate

# install python-irodsclient from github
RUN wget -O python-irodsclient.zip https://github.com/irods/python-irodsclient/archive/master.zip
RUN unzip python-irodsclient.zip && mv python-irodsclient-master python-irodsclient
WORKDIR "python-irodsclient"

USER root
RUN python setup.py install


USER syndicate
WORKDIR $HOME

###### syndicate-ag
RUN wget -O syndicate-ag.zip https://github.com/syndicate-storage/syndicate-ag/archive/master.zip
RUN unzip syndicate-ag.zip && mv syndicate-ag-master syndicate-ag
WORKDIR "syndicate-ag"

RUN make

USER root
RUN make install
RUN ldconfig

USER syndicate
WORKDIR $HOME

###### syndicate-rg
RUN wget -O syndicate-rg.zip https://github.com/syndicate-storage/syndicate-rg/archive/master.zip
RUN unzip syndicate-rg.zip && mv syndicate-rg-master syndicate-rg
WORKDIR "syndicate-rg"

RUN make

USER root
RUN make install
RUN ldconfig

USER syndicate
WORKDIR $HOME

###### syndicate-filesystem-driver
RUN wget -O syndicate-fs-driver.zip https://github.com/syndicate-storage/syndicate-fs-driver/archive/master.zip
RUN unzip syndicate-fs-driver.zip && mv syndicate-fs-driver-master syndicate-fs-driver
WORKDIR "syndicate-fs-driver"

USER root
RUN python setup.py install

WORKDIR $HOME

