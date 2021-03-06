CREATE TABLE Listings_Summary(
   id int,
   name varchar(100),
   host_id int,
   host_name varchar(100),
   neighbourhood_group varchar(100),
   neighbourhood varchar(1000),
   latitude varchar(200),
   longitude varchar(200),
   room_type varchar(200),
   price money,
   minimum_nights int,
   number_of_reviews int,
   last_review varchar(100),
   reviews_per_month varchar(100),
   calculated_host_listings_count int,
   availability_365 int,
   PRIMARY KEY (id)
);
/* check the table */
--select * from Listings_Summary where id = 470219;