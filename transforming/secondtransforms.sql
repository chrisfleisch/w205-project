
DROP TABLE whiskey_business_stage;

CREATE TABLE whiskey_business_stage AS 
SELECT  
V.brand as `Name`,
V.altprice as `Price`, 
V.oz as `NumOz`, 
V.description as `Type`, 
sum(R.avg_rating)/count(avg_rating) as `RedditScore`, 
sum(M.MetaCritic)/count(M.MetaCritic) as `CriticScore`, 
sum(P.Rating)/count(P.Rating) as `AwardScore`, 
sum(V.altprice)/sum(V.oz) as `VAPricePerOz`,
Case 
when sum(P.Price) > 0 then ((sum(R.altbottleprice) + sum(P.price))/2)/sum(V.oz)
when sum(P.Price) IS NULL then sum(R.altbottleprice)/sum(V.oz) 
end as `MarketPricePerOz`
From vaprices V 
LEFT JOIN reddit_bottles  R on V.altbrand=R.altbrand 
LEFT JOIN metacritic M on V.altbrand=M.altbrand 
LEFT JOIN proof P on V.altbrand=P.altbrand
GROUP BY V.brand, V.altprice, V.oz, V.description;

DROP TABLE whiskey_business;

CREATE TABLE whiskey_business AS
SELECT   Name, Price, `NumOz`, `Type`,`RedditScore`, `CriticScore`,`AwardScore`,`VAPricePerOz`,`MarketPricePerOz`,
Case
WHEN `MarketPricePerOz` IS NULL THEN 'No'
ELSE 'Yes'
END `PriceBenchmark`
FROM whiskey_business_stage;

