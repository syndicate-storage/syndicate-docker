# Syndicate gateways
#
# VERSION	1.0

FROM	syndicate-core
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# syndicate AG/RG/UG
##############################################
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --force-yes\
    syndicate-ag \
    syndicate-rg \
    syndicate-fs-driver \ 
    syndicate-ug-tools \
    syndicatefs

USER $USER
WORKDIR $HOME
