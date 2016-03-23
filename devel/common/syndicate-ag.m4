##############################################
# syndicate
##############################################
RUN pip install pika python-irodsclient retrying timeout_decorator pyinotify

USER syndicate
WORKDIR $HOME

###### syndicate-ag
RUN wget -O syndicate-ag.zip https://github.com/syndicate-storage/syndicate-ag/archive/master.zip
RUN unzip syndicate-ag.zip
RUN mv syndicate-ag-master syndicate-ag
WORKDIR "syndicate-ag"

RUN make

USER root
RUN make install

USER syndicate
WORKDIR $HOME

###### syndicate-filesystem-ag-driver
RUN wget -O syndicate-fs-driver.zip https://github.com/syndicate-storage/syndicate-fs-driver/archive/master.zip
RUN unzip syndicate-fs-driver.zip
RUN mv syndicate-fs-driver-master syndicate-fs-driver
WORKDIR "syndicate-fs-driver"

USER root
RUN python setup.py install

WORKDIR $HOME

