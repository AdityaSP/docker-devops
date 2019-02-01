#!/bin/sh
sed -i "s/Listen 80/Listen $APACHE_PORT/" /etc/apache2/httpd.conf
exec "$@"
