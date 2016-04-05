##############################################
# fskit
##############################################
RUN apt-get install -y libfuse-dev libattr1-dev

USER syndicate
WORKDIR $HOME

RUN wget -O fskit.zip https://github.com/jcnelson/fskit/archive/master.zip
RUN unzip fskit.zip
RUN mv fskit-master fskit
WORKDIR "fskit"
RUN make

USER root
RUN make install
RUN ldconfig

##############################################
# syndicate
##############################################
RUN apt-get install -y protobuf-compiler libprotobuf-dev libcurl4-gnutls-dev libmicrohttpd-dev libjson0-dev valgrind cython python-protobuf libssl-dev python-crypto python-requests
RUN pip install grequests gevent greenlet

USER syndicate
WORKDIR $HOME

###### syndicate-core
RUN wget -O syndicate-core.zip https://github.com/syndicate-storage/syndicate-core/archive/master.zip
RUN unzip syndicate-core.zip
RUN mv syndicate-core-master syndicate-core
WORKDIR "syndicate-core"

# replace localhost to MS_HOST
ifdef(`DEF_MS_HOST',
RUN sed -i 's/localhost/DEF_MS_HOST/g' ms/common/msconfig.py,
)

ifdef(`DEF_MS_APP_ADMIN_EMAIL',
RUN make MS_APP_ADMIN_EMAIL=DEF_MS_APP_ADMIN_EMAIL,
RUN make
)

USER root
RUN make install
RUN ldconfig

WORKDIR $HOME
