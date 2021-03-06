--Show all the listings in neighbourhood AMPELOKHPOI that their price is over 200 $ from the cheaper to the most expensive listing
SELECT Listings_Summary.name,Listings_Summary.id,Listings_Summary.price, Listings_Summary.neighbourhood
FROM Listings_Summary
WHERE (price::numeric >=100 and neighbourhood = 'ΑΜΠΕΛΟΚΗΠΟΙ' )
ORDER BY price;
-- 18 rows affected


-- Show all listings,in Ambelokipi, with their urls which they have TV and Wifi
SELECT Listings.id, Listings.listing_url,Listings.neighbourhood
FROM Listings
WHERE (access LIKE '%TV%' and access LIKE '%Wifi%') and neighbourhood = 'Ambelokipi'
GROUP BY Listings.id;
-- 1 row affected.

/* JOINS */

-- Show all the comments of each listing between January 2019 to June 2019
SELECT Listings.id, Reviews.comments
FROM Listings
INNER JOIN Reviews
ON Listings.id = Reviews.listing_id
WHERE Reviews.date between '2019-01-01' and '2019-06-01'
LIMIT 50;
-- 50 rows affected using limit 
-- 52822 rows affected WITHOUT using limit.


--Show which apartments are available in May of 2020 and their prices from the most expensive to the most cheapest
SELECT Calendar.listing_id, Calendar.price
FROM Listings
INNER JOIN Calendar 
ON Listings.id = Calendar.listing_id
WHERE Calendar.available = 'true' and Calendar.date between '2020-05-01' and '2020-05-31'
Group by Calendar.listing_id , Calendar.price
ORDER BY Calendar.price DESC;
--18384 rows affected.

-- Show all comments and the reviewer name of all listings with their urls and price ordered by price
SELECT Reviews.comments, Reviews.reviewer_name, Listings.id, Listings.listing_url, Listings.price
FROM Listings, Reviews
WHERE Listings.id = Reviews.listing_id
ORDER BY Listings.price
LIMIT 150;
-- 150 rows affected using limit
-- 414235 rows affected without using limit


-- Show the average rent , the minimum rent and the maximum rent someone need to rent a listing 
SELECT round(avg(Listings_Summary.price::numeric), 2) AS AVG_MONEY_FOR_RENT, MAX(Listings_Summary.price::numeric) AS MAX_MONEY_FOR_RENT, MIN(Listings_Summary.price::numeric) AS MIN_MONEY_FOR_RENT
FROM Listings_Summary
INNER JOIN Listings
ON listings.id = Listings_Summary.id
WHERE Listings_Summary.price is not null;
-- 1 row affected


-- Show the number of reviews of specified listings and the reviews columns about them 
SELECT Reviews.* ,Listings.name , Listings.number_of_reviews
FROM Listings
INNER JOIN Reviews ON Listings.id = Reviews.listing_id 
WHERE Listings.id = 203147 OR Listings.id = 33453783  or Listings.id = 3976641;
-- 140 rows affected


-- Show which listings and their neighbourhoods that they have more than 4 bedrooms,more than 5 beds and of cource their price 
SELECT Neighbourhoods.neighbourhood , Listings.id, Listings.name , Listings.listing_url, Listings.bedrooms , Listings.price , Listings.beds
FROM Neighbourhoods 
INNER JOIN Listings
ON Neighbourhoods.neighbourhood = Listings.neighbourhood_cleansed 
WHERE Listings.bedrooms > 4 and Listings.beds >  5 and Listings.price::numeric < 200;
-- 28 rows affected

-- Show all apartments that have price <= 400 and there are available on 25-05-2020
SELECT Listings.id , Listings.name , Listings.listing_url , Listings.price 
FROM Listings
INNER JOIN Calendar 
ON Listings.id = Calendar.listing_id
WHERE Calendar.date = '2020-05-25' and Calendar.available = 'true' and Listings.price::numeric <= 400
ORDER BY Listings.price DESC;
-- 7972 rows affected

-- Show infos such as id ,name,url,price about listings that they are available between 26-30/06/2020 in neighbourhood Ambelokipi and their price is under of 250
SELECT Listings.id, Listings.name , Listings.listing_url, Listings.price
FROM Listings
INNER JOIN (SELECT DISTINCT Calendar.listing_id
	FROM Calendar
	WHERE Calendar.available = 'true' AND Calendar.date between '2020-06-26' AND '2020-06-30') AS NID 
ON Listings.id = NID.listing_id
WHERE Listings.price::numeric <= 250 AND Listings.neighbourhood = 'Ambelokipi'
ORDER BY Listings.price DESC;
-- 414 rows affected 

/* OUTER JOINS */

-- Show the number of neighbourhoods with no listings
SELECT COUNT(*) 
FROM (
SELECT N.neighbourhood, L.id
FROM  Neighbourhoods N  
LEFT OUTER JOIN  Listings L 
ON N.neighbourhood = L.neighbourhood_cleansed) AS LEFT_JOIN
WHERE LEFT_JOIN.id = null ;
-- 1 row affected

-- Show the neighbourhoods there and the longitude with the same specified coordinates 
select DISTINCT listings.longitude , listings.neighbourhood
from listings
right outer join geolocation 
on listings.longitude = geolocation.geometry_coordinates_0_0_1_0
where geolocation.geometry_coordinates_0_0_0_0::numeric = 23.76448 or listings.longitude::numeric = 23.71568;
-- 3 rows affected.