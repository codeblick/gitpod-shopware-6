FROM gitpod/workspace-full

USER root

COPY etc/apache2/apache2.conf /etc/apache2/apache2.conf

RUN apt-get update && \
    apt-get -y install \
        mysql-server

COPY etc/mysql/my.cnf /etc/mysql/my.cnf

RUN mkdir /var/run/mysqld && \
    chown gitpod:gitpod /var/run/mysqld && \
    sudo sed -i 's/^bind-address.*/#&/' /etc/mysql/mysql.conf.d/mysqld.cnf
