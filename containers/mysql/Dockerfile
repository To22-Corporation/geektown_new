FROM mysql:5.7.23
LABEL title="mysql server"
LABEL version="1.0"

COPY db/init.sql /docker-entrypoint-initdb.d
