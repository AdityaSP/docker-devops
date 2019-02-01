FROM alpine:3.8
ENV APACHE_PORT 80
RUN apk update && apk add apache2 && mkdir /run/apache2
COPY mypage.html /var/www/localhost/htdocs

COPY docker-entrypoint.sh /bin
RUN chmod +x /bin/docker-entrypoint.sh
#VOLUME /var/log/apache2
ENTRYPOINT ["docker-entrypoint.sh"]
RUN 	ln -sf /dev/stdout /var/log/apache2/access.log \
        && ln -sf /dev/stderr /var/log/apache2/error.log

CMD ["httpd", "-D", "FOREGROUND"]
