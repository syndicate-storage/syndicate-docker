# Syndicate gateways for R
#
# VERSION	1.0

FROM	syndicate-gateways-dev
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

USER root

##############################################
# Setup R
##############################################
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
    gpg -a --export E084DAB9 | apt-key add -

RUN apt-get update && \
    apt-get install -y r-base

USER $USER

##############################################
# Setup CRAN repository
##############################################
ADD Rprofile $HOME/.Rprofile
