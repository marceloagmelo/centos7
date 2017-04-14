## Docker Image Base
FROM centos:7

## Maintainer
MAINTAINER Marcelo Melo <mmelo@produban.com.br> 

#######################################################################
##### We have to expose image metada as label and ENV
#######################################################################
LABEL com.produban.imageowner="Corporate Techonology" \
      com.produban.description="CentOS 7" \
      com.prpoduban.image="marceloagmelo/centos7:1.0.0"

ENV com.produban.imageowner="Corporate Techonology"
ENV com.produban.description="CentOS 7"
ENV com.prpoduban.image="com.prpoduban.image="marceloagmelo/centos7:1.0.0"

ENV APP_HOME /opt/app
ENV IMAGE_SCRIPTS_HOME /opt/prodevelopment

RUN  mkdir -p $IMAGE_SCRIPTS_HOME && \
     mkdir -p $APP_HOME

RUN yum clean all && yum -y install \
    gcc-c++ \\
    make \
    vim \
    net-tools \
    telnet \
    iputils-ping \
    curl \
    procps-ng \
    git \
    tar \
    unzip \
    rsync \
    libaio \
    openssl-devel \
    apr-devel \
    samba-client \
    wget && yum clean all && \
    rm -Rf tmp/* && rm -Rf /var/tmp/*

ADD scripts $IMAGE_SCRIPTS_HOME
COPY Dockerfile $IMAGE_SCRIPTS_HOME/Dockerfile

EXPOSE 8000

WORKDIR $IMAGE_SCRIPTS_HOME
ENTRYPOINT [ "./control.sh" ]
CMD [ "start" ]