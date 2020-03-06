
To build the Docker image containing the postgresql other
tools:

	docker build . -t flo/postgis

Process NAS files to pg_dump

	docker run -it --rm -v $PWD:/current \
		-e NASDIR=data \
		-e OUTPUT=alkis-nas.$(date +%Y%m%d%H%M).sql \
		flo/postgis /current/process-nas-to-pgdump

To diff the NAS/ALKIS dump against OSM 

	docker run -it --rm -v $PWD:/current \
		-e PBFFILE=kreis-guetersloh-latest.osm.pbf \
		-e ALKISFILE=alkis.sql \
		-e OUTPUT=alkis-gebaeude-diff.$(date +%Y%m%d%H%M).sqlite \
		flo/postgis /current/process-diff-alkis-osm
