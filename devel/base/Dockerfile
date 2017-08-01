# syndicate-docker-base-dev
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

ARG admin=iychoi@email.arizona.edu
ARG mshost=localhost

##############################################
# Setup environment
##############################################
ENV LD_LIBRARY_PATH /usr/local/lib

##############################################
# Setup a Syndicate account
##############################################
ENV HOME /home/syndicate

RUN useradd syndicate && echo 'syndicate:syndicate' | chpasswd && \
    echo "syndicate ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /home/syndicate && \
    chown -R syndicate:syndicate $HOME

ENV USER syndicate
WORKDIR $HOME

##############################################
# Setup utility packages
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    wget curl unzip python-pip build-essential fuse && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log && \
    groupadd -f fuse && \
    usermod -aG fuse $USER

USER root

##############################################
# fskit
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    libfuse-dev libattr1-dev && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log

USER $USER
RUN wget -O fskit.zip https://github.com/jcnelson/fskit/archive/master.zip && \
    unzip fskit.zip && mv fskit-master fskit
WORKDIR "fskit"
RUN make

USER root
RUN make install
RUN ldconfig

##############################################
# syndicate
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    protobuf-compiler libprotobuf-dev libgnutls-dev libjson0-dev valgrind \
    cython python-protobuf libssl-dev libgcrypt11-dev libcurl4-gnutls-dev \
    python-crypto python-requests python-dev && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log && \
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
RUN wget -O syndicate-core.zip https://github.com/syndicate-storage/syndicate-core/archive/master.zip && \
    unzip syndicate-core.zip && mv syndicate-core-master syndicate-core
WORKDIR "syndicate-core"

RUN make MS_APP_ADMIN_EMAIL=$admin MS_APP_PUBLIC_HOST=$mshost

USER root
RUN make install && ldconfig

USER $USER
WORKDIR $HOME
