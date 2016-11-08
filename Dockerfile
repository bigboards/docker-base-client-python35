# Pull base image.
#FROM bigboards/base-client-__arch__
FROM bigboards/base-client-x86_64

MAINTAINER bigboards
USER root

RUN sudo add-apt-repository ppa:fkrull/deadsnakes \
 && apt-get update \
 && apt-get -y install python3.5 \
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb \

# external ports
EXPOSE 2222

# Define default command.
CMD ["/usr/sbin/sshd", "-D"]