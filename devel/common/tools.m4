##############################################
# Setup utility packages
##############################################
RUN apt-get update && \
    apt-get install -y wget curl unzip python-pip build-essential ssh tcpdump
