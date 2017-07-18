# syndicate-docker-ms
#
# VERSION	1.0

FROM	syndicate-docker-base
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

ARG admin=iychoi@email.arizona.edu
ARG mshost=localhost

USER root

##############################################
# useful tools & syndicate-ms
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    unzip wget build-essential syndicate-ms && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log

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
# syndicate MS
##############################################
USER root
COPY configure_ms.mk.ms /usr/src/syndicate/ms/configure_ms.mk
COPY app.yamlin.ms /usr/src/syndicate/ms/app.yamlin
COPY Makefile.ms /usr/src/syndicate/ms/Makefile

RUN sed -i "s/%%MS_APP_PUBLIC_HOST%%/$mshost/" /usr/src/syndicate/ms/configure_ms.mk && \
    sed -i "s/%%MS_APP_ADMIN_EMAIL%%/$admin/" /usr/src/syndicate/ms/configure_ms.mk

WORKDIR /usr/src/syndicate/ms/
RUN make all

##############################################
# Run Syndicate MS
##############################################
USER $USER
WORKDIR $HOME

RUN mkdir syndicate_ms_data

CMD echo "Starting Syndicate MS..." && $HOME/google_appengine/dev_appserver.py --admin_host=0.0.0.0 --host=0.0.0.0 --storage_path=$HOME/syndicate_ms_data --skip_sdk_update_check=true /usr/src/syndicate/ms
