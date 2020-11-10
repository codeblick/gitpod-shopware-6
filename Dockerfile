FROM gitpod/workspace-full

USER root

ENV APACHE_DOCROOT_IN_REP=src/public
ENV APACHE_LOG_DIR=/workspace/shopware/etc/apache2/logs
RUN echo -e '\nexport APACHE_DOCROOT_IN_REP=src/public\nexport APACHE_LOG_DIR=/workspace/shopware/etc/apache2/logs' >> /etc/apache2/envvars


RUN apt-get update && \
    apt-get -y install \
        mysql-server

COPY etc/mysql/my.cnf /etc/mysql/my.cnf

RUN mkdir /var/run/mysqld && \
    chown gitpod:gitpod /var/run/mysqld && \
    sudo sed -i 's/^bind-address.*/#&/' /etc/mysql/mysql.conf.d/mysqld.cnf
