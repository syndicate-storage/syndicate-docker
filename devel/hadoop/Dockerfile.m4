# Syndicate Hadoop (H-Syndicate)
#
# VERSION	1.0

FROM	ubuntu:14.04
MAINTAINER	Illyoung Choi <iychoi@email.arizona.edu>

include(`common_head.m4')

include(`tools.m4')

include(`h-syndicate.m4')

USER syndicate
WORKDIR $HOME

