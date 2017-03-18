
DROP TABLE altredditarchive;
CREATE TABLE altredditarchive AS SELECT timestamp, whiskyname, reviewerusername, link, cast(Rating as int), style, bottleprice, reviewdate, altbrand, cast(altbottleprice as float) FROM altredditarchive_raw;

DROP TABLE altvaprices;
CREATE TABLE altvaprices AS SELECT description, code, brand, size, age, cast(Proof as float), price, altbrand, cast(oz as float), cast(altprice as float), cast(altage as float) FROM altvaprices_raw;

DROP TABLE MetaCriticWhiskyDatabase;
CREATE TABLE MetaCriticWhiskyDatabase AS SELECT Whisky, cast(MetaCritic as float), cast(STDEV as float), cast(Number as int), cast(Cost as float), Class, SuperCluster, Cluster, Country, Type FROM MetaCriticWhiskyDatabase_raw;

DROP TABLE proof;
CREATE TABLE proof AS SELECT Name, cast(Rating as int), cast(Rabble as float), Price FROM proof_raw;

DROP TABLE RedditWhiskyNetworkReviewArchiveReviewArchive;
CREATE TABLE RedditWhiskyNetworkReviewArchiveReviewArchive AS SELECT Timestamp, WhiskyName, ReviewersRedditUsername, LinkToRedditReview, cast(ReviewerRating as int), WhiskyRegionorStyle, cast(FullBottlePricePaid as float), DateofReview FROM RedditWhiskyNetworkReviewArchiveReviewArchive_raw;

DROP TABLE VAPriceList;
CREATE TABLE VAPriceList AS SELECT Description, Code, Brand, Size, Age, cast(Proof as float), Price FROM VAPriceList_raw;

