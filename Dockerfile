FROM centos:7

MAINTAINER Petr Kramar

RUN rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
RUN yum update -y 
RUN yum install -y mysql-community-server \
	mysql-community-client \
	mysql-connector-java \ 
	tomcat

RUN ln -s /usr/share/java/mysql-connector-java.jar /usr/share/java/tomcat/

ADD http://downloads.sourceforge.net/project/ganib/Ganib-5.0/ganib.war  /usr/share/tomcat/webapps/
COPY res/ganib.xml /usr/share/tomcat/conf/Catalina/localhost/
RUN echo "CATALINA_BASE=\$CATALINA_HOME" >> /etc/tomcat/tomcat.conf


# set up mysql
COPY res/mysql_init.sh /tmp/
COPY res/mysql_db.sql /tmp/
COPY res/ganib.sql /tmp/
RUN bash /tmp/mysql_init.sh

# clean up
RUN rm -f /tmp/mysql_init.sh /tmp/mysql_db.sql /tmp/ganib.sql

EXPOSE 8080

# run services
CMD tomcat start ; mysqld_safe
