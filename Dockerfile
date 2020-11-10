FROM gitpod/workspace-full

USER root

ENV APACHE_DOCROOT_IN_REP="src/public"
ENV APACHE_LOG_DIR="/workspace/etc/apache/logs"

RUN apt-get update && \
    apt-get -y install \
        mysql-server

COPY etc/mysql/my.cnf /etc/mysql/my.cnf

RUN mkdir /var/run/mysqld && \
    chown gitpod:gitpod /var/run/mysqld && \
    sudo sed -i 's/^bind-address.*/#&/' /etc/mysql/mysql.conf.d/mysqld.cnf
