
DROP TABLE MetaCriticWhiskyDatabase_raw;
CREATE EXTERNAL TABLE MetaCriticWhiskyDatabase_raw (Whisky String,MetaCritic String,STDEV String,Number String,Cost String,Class String,SuperCluster String,Cluster String,Country String,Type String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/MetaCriticWhiskyDatabase_raw';

DROP TABLE RedditWhiskyNetworkReviewArchiveReviewArchive_raw;
CREATE EXTERNAL TABLE RedditWhiskyNetworkReviewArchiveReviewArchive_raw (Timestamp String,WhiskyName String,ReviewersRedditUsername String,LinkToRedditReview String,ReviewerRating String,WhiskyRegionorStyle String,FullBottlePricePaid String,DateofReview String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/RedditWhiskyNetworkReviewArchiveReviewArchive_raw';

DROP TABLE VAPriceList_raw;
CREATE EXTERNAL TABLE VAPriceList_raw (Description String,Code String,Brand String,Size String,Age String,Proof String,Price String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/VAPriceList_raw';

DROP TABLE altredditarchive_raw;
CREATE EXTERNAL TABLE altredditarchive_raw (id String,timestamp String,whiskyname String,reviewerusername String,link String,rating String,style String,bottleprice String,reviewdate String,altbrand String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/altredditarchive_raw';

DROP TABLE altvaprices_raw;
CREATE EXTERNAL TABLE altvaprices_raw (id String,description String,code String,brand String,size String,age String,proof String,price String,altbrand String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/altvaprices_raw';

DROP TABLE proof_raw;
CREATE EXTERNAL TABLE proof_raw (Name String,Rating String,Rabble String,Price String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/proof_raw';

