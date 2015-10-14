FROM oberthur/docker-alpine-glibc:3.2

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ADD start-openntpd.sh /bin/start-openntpd.sh
ADD ntpd.conf /etc/ntpd.conf.template

# Prepare image
RUN mkdir /var/empty \
    && chown root /var/empty \
    && chmod 700 /var/empty \
    && chmod +x /bin/start-openntpd.sh \
    && apk add openntpd bash --update-cache

ENTRYPOINT ["/bin/start-openntpd.sh"]

