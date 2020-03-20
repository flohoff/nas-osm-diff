
drop table if exists meta;
drop table if exists files;

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE files ( id serial, name varchar, mime varchar, content blob );

CREATE TABLE meta ( key varchar, value varchar );
INSERT INTO "meta" VALUES('contact.email','f@zz.de');
INSERT INTO "meta" VALUES('contact.name','Florian Lohoff');

INSERT INTO meta VALUES( 'time.data', strftime('%Y-%m-%d %H:%M','now'));
INSERT INTO meta VALUES( 'time.process', strftime('%Y-%m-%d %H:%M','now'));

INSERT INTO "meta" VALUES('center.lat','51.93326');
INSERT INTO "meta" VALUES('center.lon','8.80966');
INSERT INTO "meta" VALUES('center.zoom','12');

INSERT INTO "meta" VALUES('style.default.color','#888888');
INSERT INTO "meta" VALUES('style.default.weight','3');
INSERT INTO "meta" VALUES('style.default.opacity','0.9');

INSERT INTO "meta" VALUES('style.red.color','#ff0000');
INSERT INTO "meta" VALUES('style.red.weight','3');
INSERT INTO "meta" VALUES('style.red.opacity','0.9');

INSERT INTO "meta" VALUES('style.yellow.color','#ffff00');
INSERT INTO "meta" VALUES('style.yellow.weight','3');
INSERT INTO "meta" VALUES('style.yellow.opacity','0.9');

INSERT INTO "meta" VALUES('style.green.color','#00ff00');
INSERT INTO "meta" VALUES('style.green.weight','3');
INSERT INTO "meta" VALUES('style.green.opacity','0.9');

INSERT INTO "meta" VALUES('layer.alkisnotinosm.shortdescription','ALKIS/NAS differences to OSM for Kreis Gütersloh');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.geometrycolumn','geom');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.srid','4326');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.stylecolumn','style');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.columns:0','ogc_fid');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.columns:1','text');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.columns:2','style');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.columns:3','gmlid');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.columns:4','alkisarea');
INSERT INTO "meta" VALUES('layer.alkisnotinosm.popup', ( readfile('alkisdiff-alkisnotinosm-meta.popup' )) );

INSERT INTO "meta" VALUES( 'boundary', ( readfile('kreis-guetersloh.geojson')));

COMMIT;
