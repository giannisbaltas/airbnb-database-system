CREATE TABLE Location
  AS (SELECT DISTINCT id as listing_id,street,neighbourhood,neighbourhood_cleansed,city,state,zipcode,market,smart_location,country_code,country,latitude,longitude,is_location_exact
	 FROM listings);
	 
alter table Location
add foreign key (listing_id) references Listings(id);

alter table Listings
drop CONSTRAINT listings_neighbourhood_cleansed_fkey;

alter table Location
add foreign key (neighbourhood_cleansed) references Neighbourhoods(neighbourhood);

  ALTER TABLE Listings 
  DROP COLUMN street,
  DROP COLUMN neighbourhood,
  DROP COLUMN neighbourhood_cleansed,
  DROP COLUMN city,
  DROP COLUMN state,
  DROP COLUMN zipcode,
  DROP COLUMN market,
  DROP COLUMN smart_location,
  DROP COLUMN country_code,
  DROP COLUMN country,
  DROP COLUMN latitude,
  DROP COLUMN longitude,
  DROP COLUMN is_location_exact;

