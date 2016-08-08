##############################################
# Setup R
##############################################
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
    gpg -a --export E084DAB9 | apt-key add -

RUN apt-get update && \
    apt-get install -y r-base
