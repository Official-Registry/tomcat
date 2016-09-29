FROM quay.io/lizhongwen/oracle-jdk:1.8

MAINTAINER github.com/Official-Registry, lizhongwen1989@gmail.com

ENV TOMCAT_VERSION=8.5.5
ENV TOMCAT_HOME=/opt/app/apache-tomcat-${TOMCAT_VERSION}
ENV JAVA_DEBUG=false
ENV JVM_MIN_MEM=256
ENV JVM_MAX_MEM=1024

RUN apt-get install -y unzip \
  && curl --fail --location --retry 3 \
    http://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz \
    -o /tmp/tomcat.tar.gz \
  && mkdir -p /opt/app/ \
  && tar -zvxf /tmp/tomcat.tar.gz -C /opt/app/ \
  && rm -rf /tmp/tomcat.tar.gz ${TOMCAT_HOME}/webapps/*

ADD resources/entrypoint.sh ${TOMCAT_HOME}/bin/

RUN chmod +x ${TOMCAT_HOME}/bin/entrypoint.sh

EXPOSE 8080 8888

ENTRYPOINT ["/bin/sh", "-c", "${TOMCAT_HOME}/bin/entrypoint.sh"]
