
DROP TABLE metacritic;
CREATE TABLE metacritic AS SELECT whisky, cast(metacritic as float) as metacritic, cast(stdev as float) as stdev, count, cast(Cost as float) as Cost, class, supercluster, cluster, country, type, altbrand FROM metacritic_raw;

DROP TABLE proof;
CREATE TABLE proof AS SELECT name, cast(Rating as int) as Rating, cast(Rabble as float) as Rabble, price, altbrand FROM proof_raw;

DROP TABLE redditarchive;
CREATE TABLE redditarchive AS SELECT timestamp, whiskyname, reviewerusername, link, cast(Rating as int) as Rating, style, bottleprice, reviewdate, altbrand, cast(altbottleprice as float) as altbottleprice FROM redditarchive_raw;

DROP TABLE vaprices;
CREATE TABLE vaprices AS SELECT description, code, brand, size, age, cast(Proof as float) as Proof, price, altbrand, cast(oz as float) as oz, cast(altprice as float) as altprice, cast(altage as float) as altage FROM vaprices_raw;


DROP TABLE reddit_bottles;
CREATE TABLE reddit_bottles AS SELECT altbrand, sum(Rating)/count(Rating) as avg_rating, count(Rating) as num_reviews FROM redditarchive WHERE rating > 0 GROUP BY altbrand;

DROP TABLE whiskey_business;
CREATE TABLE whiskey_business AS SELECT  V.brand, V.oz as size,  sum(R.avg_rating)/count(avg_rating) as avg_rating, sum(MetaCritic)/count(MetaCritic) as critic_score,  V.altprice, sum(V.altprice)/sum(V.oz) as price_per_oz  from vaprices V LEFT JOIN reddit_bottles  R on V.altbrand=R.altbrand LEFT JOIN metacritic M on V.altbrand=M.altbrand GROUP BY V.brand, V.altprice, V.oz;

