# Mysql dockerfile
# 
# This install the default mysql-server package
#
# It is modify to run mysql in the foreground and exit on INT signal
#
# The deafult password is "password".
#
FROM ubuntu
MAINTAINER Guillermo Álvarez <guillermo@cientifico.net>
RUN apt-get install mysql-server -y
ADD my.cnf /etc/mysql/my.cnf
ADD change_password /tmp/change_password
ADD mysqld-wrapper /usr/sbin/mysqld-wrapper
RUN /tmp/change_password
RUN rm /tmp/change_password
CMD /usr/sbin/mysqld-wrapper
EXPOSE 3306
