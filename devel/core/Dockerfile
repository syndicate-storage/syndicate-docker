# Syndicate core dev
#
# VERSION	1.0

FROM	syndicate-base
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

ARG admin=iychoi@email.arizona.edu
ARG mshost=localhost

USER root

##############################################
# fskit
##############################################
RUN apt-get install -y libfuse-dev libattr1-dev

USER $USER
RUN wget -O fskit.zip https://github.com/jcnelson/fskit/archive/master.zip
RUN unzip fskit.zip && mv fskit-master fskit
WORKDIR "fskit"
RUN make

USER root
RUN make install
RUN ldconfig

##############################################
# syndicate
##############################################
RUN apt-get install -y protobuf-compiler libprotobuf-dev libgnutls-dev libjson0-dev valgrind cython python-protobuf libssl-dev libgcrypt11-dev libcurl4-gnutls-dev python-crypto python-requests && \
    pip install grequests gevent greenlet

###### libmicrohttpd (0.9.44)
RUN wget https://butler.opencloud.cs.arizona.edu/stopgap/libmicrohttpd-dbg_0.9.44+dfsg-1ubuntu2_amd64.deb && \
    wget https://butler.opencloud.cs.arizona.edu/stopgap/libmicrohttpd-dev_0.9.44+dfsg-1ubuntu2_amd64.deb && \
    wget https://butler.opencloud.cs.arizona.edu/stopgap/libmicrohttpd10_0.9.44+dfsg-1ubuntu2_amd64.deb && \
    dpkg -i libmicrohttpd-dbg_0.9.44+dfsg-1ubuntu2_amd64.deb libmicrohttpd-dev_0.9.44+dfsg-1ubuntu2_amd64.deb libmicrohttpd10_0.9.44+dfsg-1ubuntu2_amd64.deb && \
    apt-get -f install && \
    rm libmicrohttpd-dbg_0.9.44+dfsg-1ubuntu2_amd64.deb libmicrohttpd-dev_0.9.44+dfsg-1ubuntu2_amd64.deb libmicrohttpd10_0.9.44+dfsg-1ubuntu2_amd64.deb

USER $USER
WORKDIR $HOME

###### syndicate-core
RUN wget -O syndicate-core.zip https://github.com/iychoi/syndicate-core/archive/master.zip && \
    unzip syndicate-core.zip && mv syndicate-core-master syndicate-core
WORKDIR "syndicate-core"

RUN make MS_APP_ADMIN_EMAIL=$admin MS_APP_PUBLIC_HOST=$mshost

USER root
RUN make install && ldconfig

USER $USER
WORKDIR $HOME
