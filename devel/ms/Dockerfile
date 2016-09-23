# Syndicate ms
#
# VERSION	1.0

FROM	syndicate-core
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

##############################################
# google app engine
##############################################
USER $USER
WORKDIR $HOME

RUN wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.33.zip
RUN unzip google_appengine_1.9.33.zip

# Google App Engine Admin
expose 8000

##############################################
# Run Syndicate MS
##############################################
RUN mkdir datastore

CMD $HOME/google_appengine/dev_appserver.py --admin_host=0.0.0.0 --host=0.0.0.0 --storage_path=$HOME/datastore --skip_sdk_update_check=true $HOME/syndicate-core/build/out/ms
