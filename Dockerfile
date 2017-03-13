FROM oberthur/docker-ubuntu:16.04

MAINTAINER Karol Kornatka <k.kornatka@oberthur.com>

ENV OPENNTPD_VESRION="1:5.7p4-2"
ADD start-openntpd.sh /bin/start-openntpd.sh
ADD ntpd.conf /etc/ntpd.conf.template

# Prepare image
RUN mkdir /var/run/openntpd \
    && chown root /var/run/openntpd \
    && chmod 700 /var/run/openntpd \
    && chmod +x /bin/start-openntpd.sh \
    && apt update && apt install openntpd=$OPENNTPD_VESRION \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

ENTRYPOINT ["/bin/start-openntpd.sh"]& chmod +x /bin/start-openntpd.sh \
