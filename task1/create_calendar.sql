CREATE TABLE Calendar(
	listing_id int,
	date date,
	available boolean,
	price money,
	adjusted_price money,
	minimum_nights int,
	maximum_nights int,
	PRIMARY KEY (listing_id,date)
);
/* check the table */
--select * from Calendar where listing_id=10595;
