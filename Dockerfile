FROM ypcs/debian:buster

ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data
EXPOSE 5432

RUN \
    /usr/local/sbin/docker-upgrade && \
    apt-get install --assume-yes \
        gosu \
        postgresql-10 && \
    /usr/local/sbin/docker-cleanup

RUN echo "listen_addresses = '*'" >>/etc/postgresql/9.6/postgresql.conf

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]
