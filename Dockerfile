FROM ypcs/debian:buster

ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data
EXPOSE 5432

RUN \
    /usr/local/sbin/docker-upgrade && \
    apt-get install --assume-yes \
        postgresql-10
    /usr/local/sbin/docker-cleanup



COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]
