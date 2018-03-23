FROM ypcs/debian:stretch

ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data
EXPOSE 5432

RUN \
    mkdir -p /usr/share/man/man1 /usr/share/man/man7 && \
    /usr/local/sbin/docker-upgrade && \
    apt-get install --assume-yes \
        gosu \
        postgresql-9.6 && \
    /usr/local/sbin/docker-cleanup

RUN echo "listen_addresses = '*'" >>/etc/postgresql/9.6/main/postgresql.conf

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]
