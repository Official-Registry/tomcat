#!/bin/bash

if [ -z ${TOMCAT_HOME} ]; then
  echo "[`date`] [ERROR] \${TOMCAT_HOME} not found."
  exit 1
fi
if [ ! -d ${TOMCAT_HOME} ]; then
  echo "[`date`] [ERROR] TOMCAT_HOME=${TOMCAT_HOME} not exists."
  exit 1
fi

if [ -z "${JVM_MIN_MEM}" ]; then
  JVM_MIN_MEM=256
fi
if [ -z "${JVM_MAX_MEM}" ]; then
  JVM_MAX_MEM=1024
fi

JAVA_OPTS="${JAVA_OPTS} -Xms${JVM_MIN_MEM}m -Xmx${JVM_MAX_MEM}m"
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=utf-8 -Duser.timezone=Asia/Shanghai"

# Java Remote Debug Enabled
if [ "true" == "${JAVA_DEBUG}" ]; then
    JAVA_OPTS="${JAVA_OPTS} -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888"
fi

export JAVA_OPTS
${TOMCAT_HOME}/bin/catalina.sh run "$@"
