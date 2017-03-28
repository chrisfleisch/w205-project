
DROP TABLE metacritic;
CREATE TABLE metacritic AS SELECT whisky, cast(MetaCritic as float) as MetaCritic, cast(STDEV as float) as STDEV, cast(Number as int) as Number, cast(Cost as float) as Cost, class, supercluster, cluster, country, type, altbrand FROM metacritic_raw;

DROP TABLE proof;
CREATE TABLE proof AS SELECT name, cast(Rating as int) as Rating, cast(Rabble as float) as Rabble, price, altbrand FROM proof_raw;

DROP TABLE redditarchive;
CREATE TABLE redditarchive AS SELECT timestamp, whiskyname, reviewerusername, link, cast(Rating as int) as Rating, style, bottleprice, reviewdate, altbrand, cast(altbottleprice as float) as altbottleprice FROM redditarchive_raw;

DROP TABLE vaprices;
CREATE TABLE vaprices AS SELECT description, code, brand, size, age, cast(Proof as float) as Proof, price, altbrand, cast(oz as float) as oz, cast(altprice as float) as altprice, cast(altage as float) as altage FROM vaprices_raw;

