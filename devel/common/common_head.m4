##############################################
# Setup environment
##############################################
ENV LD_LIBRARY_PATH /usr/local/lib

##############################################
# Setup a Syndicate account
##############################################
ENV HOME /home/syndicate

RUN useradd syndicate && echo 'syndicate:docker' | chpasswd && \
    echo "syndicate ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /home/syndicate && \
    chown -R syndicate:syndicate $HOME

WORKDIR $HOME
