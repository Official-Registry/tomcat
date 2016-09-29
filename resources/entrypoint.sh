#!/bin/bash

if [ -z "${JVM_MIN_MEM}" ]; then
  JVM_MIN_MEM=256
fi
if [ -z "${JVM_MAX_MEM}" ]; then
  JVM_MAX_MEM=1024
fi

JAVA_OPTS="${JAVA_OPTS} -Xms${MEM_MIN}m -Xmx${MEM_MAX}m"
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=utf-8 -Duser.timezone=Asia/Shanghai"

# Java Remote Debug Enabled
if [ "true" == "${JAVA_DEBUG}" ]; then
    JAVA_OPTS="${JAVA_OPTS} -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888"
fi

export JAVA_OPTS
${TOMCAT_HOME}/bin/catalina.sh run "$@"
