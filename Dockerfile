FROM amd64/debian:buster
MAINTAINER Florian Lohoff <f@zz.de>

USER root 
RUN apt-get update \
	&& echo 'APT::Install-Recommends "false";' >/etc/apt/apt.conf.d/99norecommends \
	&& echo 'APT::Install-Suggests "false";' >/etc/apt/apt.conf.d/99nosuggests \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade \
	&& DEBIAN_FRONTEND=noninteractive apt-get -fy install gdal-bin postgis postgresql unzip osm2pgsql osmium-tool \
		postgresql-11-postgis-2.5-scripts postgresql-11-postgis-2.5 osm2pgsql sqlite3 libsqlite3-mod-spatialite \
	&& apt-get clean \
	&& sed -i -e "s/.listen_addresses.*/listen_addresses = '*'/" /etc/postgresql/11/main/postgresql.conf \
	&& echo "host    all             all             0.0.0.0/0            md5" >>/etc/postgresql/11/main/pg_hba.conf 

CMD [ "bash", "-c", "( /etc/init.d/postgresql start )" ]

EXPOSE 5432
