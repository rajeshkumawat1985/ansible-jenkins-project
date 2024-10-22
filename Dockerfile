FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget unzip -y
RUN wget -O /var/www/html/little-fashion.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip
WORKDIR /var/www/html
RUN unzip little-fashion.zip
RUN cp -rf 2127_little_fashion/* . &&\
    rm -rf 2127_little_fashion
EXPOSE 8097
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
