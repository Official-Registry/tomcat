# Tomcat  
  
Apache tomcat docker image  
  
## Usage  
  
  
`docker run -d -p 8080:8080 -v ~/app/test.war:/opt/app/tomcat/webapps/ROOT.war quay.io/lizhongwen/tomcat:7.0`  
`docker run -d -p 8080:8080 -v ~/app/test:/opt/app/tomcat/webapps/ROOT quay.io/lizhongwen/tomcat:7.0`  
  
`docker run -d -p 8080:8080 -v ~/app/test.war:/opt/app/tomcat/webapps/ROOT.war quay.io/lizhongwen/tomcat:8.0`  
`docker run -d -p 8080:8080 -v ~/app/test:/opt/app/tomcat/webapps/ROOT quay.io/lizhongwen/tomcat:8.0`  
  
`docker run -d -p 8080:8080 -v ~/app/test.war:/opt/app/tomcat/webapps/ROOT.war quay.io/lizhongwen/tomcat:8.5`  
`docker run -d -p 8080:8080 -v ~/app/test:/opt/app/tomcat/webapps/ROOT quay.io/lizhongwen/tomcat:8.5`  
  
`docker run -d -p 8080:8080 -v ~/app/test.war:/opt/app/tomcat/webapps/ROOT.war -e JVM_MIN_MEM=2048 -e JVM_MAX_MEM=4096 quay.io/lizhongwen/tomcat:8.0`  
  
`# if you need debug`  
`docker run -d -p 8080:8080 -p 8888:8888 -v ~/app/test.war:/opt/app/tomcat/webapps/ROOT.war -e JAVA_DEBUG=true -e JVM_MIN_MEM=2048 -e JVM_MAX_MEM=4096 quay.io/lizhongwen/tomcat:8.0`  
  
## Environment  
  
`echo "TOMCAT_VERSION=${TOMCAT_VERSION}"`  
`echo "TOMCAT_HOME=${TOMCAT_HOME}"`  
`echo "JAVA_DEBUG=${JAVA_DEBUG}"`  
`echo "JVM_MIN_MEM=${JVM_MIN_MEM}"`  
`echo "JVM_MAX_MEM=${JVM_MAX_MEM}"`  
  
  
## Link  
  
[https://quay.io/repository/lizhongwen/tomcat](https://quay.io/repository/lizhongwen/tomcat)  
  
[https://quay.io/repository/primeton/tomcat](https://quay.io/repository/primeton/tomcat)  
  
