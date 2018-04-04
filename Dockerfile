FROM ypcs/debian:jessie

ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

RUN \
    echo "deb http://deb.debian.org/debian jessie-backports main" >/etc/apt/sources.list.d/backports.list && \
    mkdir -p /usr/share/man/man1 /usr/share/man/man7 && \
    /usr/local/sbin/docker-upgrade && \
    apt-get install --assume-yes \
        gosu \
        postgresql-9.4 && \
    /usr/local/sbin/docker-cleanup

RUN echo "listen_addresses = '*'" >>/etc/postgresql/9.4/main/postgresql.conf

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]
