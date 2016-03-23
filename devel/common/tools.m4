##############################################
# Setup utility packages
##############################################
RUN apt-get update
RUN apt-get install -y wget unzip
RUN apt-get install -y python-pip

##############################################
# build essentials
##############################################
RUN apt-get install -y build-essential

