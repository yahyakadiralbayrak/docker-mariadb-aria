ARG MARIADB_VERSION

FROM yobasystems/alpine-mariadb:${MARIADB_VERSION:-10.4.15}
LABEL maintainer="PegaFlare WAF <abuse@pegaflare.com>"

COPY 00_aria.cnf .
RUN cat /00_aria.cnf >> /etc/mysql/my.cnf
COPY ./scripts/01_secret-init.sh /scripts/pre-init.d

ARG BUILD_DATE
ARG BUILD_COMMIT

LABEL org.label-schema.schema-version="1.0" \
	org.label-schema.name="mariadb-aria" \
	org.label-schema.description="MariaDB with Aria engine used by default" \
	org.label-schema.build-date="${BUILD_DATE:-}" \
	org.label-schema.url="https://github.com/yahyakadiralbayrak/docker-mariadb-aria" \
	org.label-schema.vcs-url="https://github.com/yahyakadiralbayrak/docker-mariadb-aria.git" \
	org.label-schema.vcs-ref="${BUILD_COMMIT:-}" \
	org.label-schema.cmd="docker run -d yahyakadiralbayrak/mariadb-aria"

