
DROP TABLE metacritic;
CREATE TABLE metacritic AS SELECT whisky, cast(MetaCritic as float), cast(STDEV as float), cast(Number as int), cast(Cost as float), class, supercluster, cluster, country, type, altbrand FROM metacritic_raw;

DROP TABLE proof;
CREATE TABLE proof AS SELECT name, cast(Rating as int), cast(Rabble as float), price, altbrand FROM proof_raw;

DROP TABLE redditarchive;
CREATE TABLE redditarchive AS SELECT timestamp, whiskyname, reviewerusername, link, cast(Rating as int), style, bottleprice, reviewdate, altbrand, cast(altbottleprice as float) FROM redditarchive_raw;

DROP TABLE vaprices;
CREATE TABLE vaprices AS SELECT description, code, brand, size, age, cast(Proof as float), price, altbrand, cast(oz as float), cast(altprice as float), cast(altage as float) FROM vaprices_raw;

