FROM quay.io/lizhongwen/oracle-jdk:1.7

MAINTAINER github.com/Official-Registry, lizhongwen1989@gmail.com

ENV TOMCAT_VERSION=7.0.72
ENV TOMCAT_HOME=/opt/app/tomcat
ENV JAVA_DEBUG=false
ENV JVM_MIN_MEM=256
ENV JVM_MAX_MEM=1024

RUN apt-get install -y unzip \
  && curl --fail --location --retry 3 \
    https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.tar.gz \
    -o /tmp/tomcat.tar.gz \
  && tar -zvxf /tmp/tomcat.tar.gz -C /tmp/ \
  && mkdir -p /opt/app/ \
  && mv /tmp/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} \
  && rm -rf /tmp/tomcat.tar.gz ${TOMCAT_HOME}/webapps/*

ADD resources/entrypoint.sh ${TOMCAT_HOME}/bin/

RUN chmod +x ${TOMCAT_HOME}/bin/entrypoint.sh

EXPOSE 8080 8888

ENTRYPOINT ["/bin/sh", "-c", "${TOMCAT_HOME}/bin/entrypoint.sh"]
