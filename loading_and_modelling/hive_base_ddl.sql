
DROP TABLE MetaCriticWhiskyDatabase;
CREATE EXTERNAL TABLE MetaCriticWhiskyDatabase (Whisky String,MetaCritic String,STDEV String,Number String,Cost String,Class String,SuperCluster String,Cluster String,Country String,Type String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/MetaCriticWhiskyDatabase';

DROP TABLE RedditWhiskyNetworkReviewArchiveReviewArchive;
CREATE EXTERNAL TABLE RedditWhiskyNetworkReviewArchiveReviewArchive (Timestamp String,WhiskyName String,ReviewersRedditUsername String,LinkToRedditReview String,ReviewerRating String,WhiskyRegionorStyle String,FullBottlePricePaid String,DateofReview String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/RedditWhiskyNetworkReviewArchiveReviewArchive';

DROP TABLE VAPriceList;
CREATE EXTERNAL TABLE VAPriceList (Description String,Code String,Brand String,Size String,Age String,Proof String,Price String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/VAPriceList';

DROP TABLE proof;
CREATE EXTERNAL TABLE proof (Name String,Rating String,Rabble String,Price String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
"separatorChar"=",",
"quoteChar"="\"",
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/whiskey/proof';

