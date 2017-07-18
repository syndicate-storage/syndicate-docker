# syndicate-docker-ms-dev
#
# VERSION	1.0

FROM	syndicate-docker-base-dev
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

##############################################
# google app engine
##############################################
USER $USER
WORKDIR $HOME

RUN wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.40.zip && \
    unzip google_appengine_1.9.40.zip && \
    rm google_appengine_1.9.40.zip

# Google App Engine Admin
EXPOSE 8000

##############################################
# Run Syndicate MS
##############################################
RUN mkdir syndicate_ms_data

CMD $HOME/google_appengine/dev_appserver.py --admin_host=0.0.0.0 --host=0.0.0.0 --storage_path=$HOME/syndicate_ms_data --skip_sdk_update_check=true $HOME/syndicate-core/build/out/ms
