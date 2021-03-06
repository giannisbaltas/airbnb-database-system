--Find all listings that are available in Summer and have weekly_price less than 1500 and sum(price) more than 10000 ordered by profit (sum(price))
SELECT Price.listing_id, SUM(Price.price)
FROM Price
INNER JOIN Calendar
ON Calendar.listing_id = Price.listing_id
WHERE Calendar.date BETWEEN '2020-06-01' AND '2020-08-31'  AND Calendar.available='t' AND weekly_price>1500
GROUP BY Price.listing_id
HAVING SUM(Price.price)>10000 
ORDER BY SUM(Price.price) DESC;
-- 5 rows affected.

--Find listings that have more than 20 amenities ordered by amenities count.
SELECT Room.listing_id, COUNT(amenity_id)
FROM Room
INNER JOIN Room_Amenity
ON Room_Amenity.listing_id = Room.listing_id
GROUP BY Room.listing_id
HAVING COUNT(amenity_id)>20
LIMIT 50;
-- 7590 rows affected without using limit.

-- Find all listing url that they they located in the neighbourhood of listing id 21133739.
SELECT listing_id , Host.url
FROM Host
INNER JOIN Location
ON Host.neighbourhood = Location.neighbourhood
WHERE listing_id = 21133739 
GROUP BY Host.url , listing_id;
-- 399 rows affected.

-- Find all listings there are in plaka and they have more than 3 beds and bedrooms.
SELECT Location.listing_id , host.url , beds
FROM Location
LEFT JOIN Host
ON Host.neighbourhood = Location.neighbourhood
INNER JOIN room on room.listing_id = Location.listing_id 
where beds > 3 and bedrooms > 3 and Location.neighbourhood = 'Plaka'
GROUP BY host.url , Location.listing_id , beds;
-- 12768 rows affected.

-- Find for all listings the host name and the neighbourhood that is located.
SELECT Host.name AS HOST_NAME ,listing.name AS LISTING_NAME,location.neighbourhood
FROM Host
LEFT OUTER JOIN listing ON listing.host_id=Host.id
INNER JOIN location ON listing.id=location.listing_id
GROUP BY Host.name,listing.name,location.neighbourhood;
ORDER BY Host.name;
-- 11479 rows affected.