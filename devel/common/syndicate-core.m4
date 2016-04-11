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

ifdef(`DEF_MS_APP_ADMIN_EMAIL',
define(MS_MAKE_ARGS_ADMIN_EMAIL, MS_APP_ADMIN_EMAIL=`DEF_MS_APP_ADMIN_EMAIL'),
define(MS_MAKE_ARGS_ADMIN_EMAIL, `')
)

ifdef(`DEF_MS_HOST',
define(MS_MAKE_ARGS_HOST, MS_APP_PUBLIC_HOST=`DEF_MS_HOST'),
define(MS_MAKE_ARGS_HOST, `')
)

RUN make MS_MAKE_ARGS_ADMIN_EMAIL MS_MAKE_ARGS_HOST

USER root
RUN make install
RUN ldconfig

WORKDIR $HOME
