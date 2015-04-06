# <= centos7
FROM centos:latest
MAINTAINER Shanon Levenherz <shanonvl@gmail.com>

# Add the nginx repo
ADD nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing PHP
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# v5.6.7+
RUN yum -y install php56w php56w-opcache php56w-fpm php56w-pgsql php56-mbstring nkf

# Installing xdebug
RUN yum -y install php56w-devel php56w-pear gcc gcc-c++ autoconf automake
RUN pecl install Xdebug

# Xdebug configuration / default ports, etc.
# Other configs / timezone, short tags, etc
COPY php.d /etc/php.d

# Installing supervisor
RUN yum install -y python-setuptools
RUN easy_install pip
RUN pip install supervisor

# Adding the configuration file of the nginx
COPY nginx/conf.d /etc/nginx/conf.d
ADD  nginx/nginx.conf /etc/nginx/nginx.conf

# Adding the configuration file of the Supervisor
ADD supervisord.conf /etc/

# Ensure that php-fpm is set to run as a daemon ( for supervisor ) 
RUN sed -ie 's/daemonize = yes/daemonize = no/' /etc/php-fpm.conf

# Adding the default file
COPY www /var/www

# Set the port to 80 
EXPOSE 80
# Xdebug port
EXPOSE 9100

# Executing supervisord
# -n / --nodaemon : runs in foreground ( required for docker )
# -c <configfile> : specifies the config file
CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
