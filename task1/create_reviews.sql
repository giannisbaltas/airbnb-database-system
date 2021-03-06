CREATE TABLE Reviews(
   listing_id int,
   id int,
   date date,
   reviewer_id int,
   reviewer_name varchar(1000),
   comments text,
   PRIMARY KEY (id)
);
/* check the table*/
--select * from Reviews where listing_id=10595;