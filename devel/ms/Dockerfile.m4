# Syndicate ms
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

include(`common_head.m4')

include(`tools.m4')

include(`syndicate-core.m4')

##############################################
# google app engine
##############################################
USER syndicate
WORKDIR $HOME

RUN wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.33.zip
RUN unzip google_appengine_1.9.33.zip

# MS API
ifdef(`DEF_MS_PORT',
expose DEF_MS_PORT,
expose 8080
)

# Google App Engine Admin
expose 8000

##############################################
# Run Syndicate MS
##############################################
RUN mkdir /home/syndicate/datastore

CMD ["/home/syndicate/google_appengine/dev_appserver.py", "--admin_host=0.0.0.0", "--host=0.0.0.0", "--storage_path=/home/syndicate/datastore", "--skip_sdk_update_check=true", "/home/syndicate/syndicate-core/build/out/ms"]

