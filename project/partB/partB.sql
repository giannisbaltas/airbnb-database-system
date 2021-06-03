
/* First query */
CREATE TABLE moviesYear AS(SELECT extract(year from release_date),id FROM movies_metadata);

select date_part as year ,count(date_part) as HowManyMoviesThatYear
FROM moviesYear
GROUP BY date_part
ORDER BY date_part;

/* Second query */
SELECT y.x->'name' "name", COUNT(id)
FROM movies_metadata
CROSS JOIN LATERAL (SELECT jsonb_array_elements(movies_metadata.genres::jsonb) x) y
GROUP BY y.x;



/* Third query */
CREATE TABLE moviesCategory AS(SELECT y.x->'name' "name", id
FROM movies_metadata
CROSS JOIN LATERAL (SELECT jsonb_array_elements(movies_metadata.genres::jsonb)  x )y
GROUP BY y.x,id);

select moviescategory.name as Category ,moviesYear.date_part as Year,count(moviesYear.date_part)
from moviesCategory,moviesYear
WHERE moviesCategory.id=moviesYear.id
GROUP BY category,year
ORDER BY year,category;



/* Fourth query */
CREATE TABLE Category_Mo AS(
select movie_id , sum(rating)/count(movie_id) as MO
FROM ratings_small
group by movie_id
order by movie_id);
-----------------------------------
CREATE TABLE Category_MO2 AS( select moviescategory.name AS CATEGORY,sum(category_mo.MO)/count(moviescategory.name) as CATEGORY_MO
from moviescategory,category_mo
where category_mo.movie_id=moviescategory.id
group by moviescategory.name,moviescategory.id);
------------------------------------
SELECT CATEGORY,SUM(CATEGORY_MO2.CATEGORY_MO)/COUNT(CATEGORY) AS MO
FROM CATEGORY_MO2
GROUP BY CATEGORY
ORDER BY CATEGORY;



/* Fifth Query */
SELECT COUNT(user_id) as HowManyRatingsFromUserWithId,user_id as ID
FROM ratings_small
GROUP BY user_id
ORDER BY user_id;


/* Sixth query */
SELECT user_id,SUM(rating)/COUNT(user_id) AS AverageUserRating
FROM ratings_small
GROUP BY user_id 
ORDER BY user_id;


/* view table */
CREATE TABLE SUM_USER_RATINGS AS(SELECT user_id as User_ID, COUNT(user_id) as HowManyRatings
FROM ratings_small
GROUP BY user_id
ORDER BY user_id);

ALTER TABLE SUM_USER_RATINGS ADD PRIMARY KEY (User_ID);
CREATE TABLE AVG_USER_RATING AS(SELECT user_id as User_ID,SUM(rating)/COUNT(user_id) AS AverageUserRating
FROM ratings_small
GROUP BY user_id 
ORDER BY user_id);

ALTER TABLE AVG_USER_RATING ADD PRIMARY KEY (User_ID);
CREATE TABLE VIEW_TABLE2 AS(SELECT SUM_USER_RATINGS.USER_ID,HowManyRatings,AVG_USER_RATING.AverageUserRating
FROM AVG_USER_RATING,SUM_USER_RATINGS
WHERE SUM_USER_RATINGS.USER_ID=AVG_USER_RATING.USER_ID);
SELECT * FROM VIEW_TABLE2;//EMFANIZEI TON PINAKA VIEW_TABLE2

/* Gia na ypologisoume to view table ftiaksame 2 sxeseis apo ton idio pinaka ton ratings_small 
kai apo ena query mporesame na enwsoume tous 2 aytous pinakes kai na paroume tin pliroforia gia kathe
xristi ton arithmo twn ratings kai ton meso oro olwn twn ratings */



