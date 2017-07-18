# syndicate-docker-gateways
#
# VERSION	1.0

FROM	syndicate-docker-base
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# syndicate AG/RG/UG
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends \
    syndicate-ag \
    syndicate-rg \
    syndicate-fs-driver \ 
    syndicate-ug-tools \
    syndicatefs && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/cache /var/lib/log

USER $USER
WORKDIR $HOME
