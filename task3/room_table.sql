CREATE TABLE Room
  AS (SELECT DISTINCT id as listing_id, accommodates, bathrooms, bedrooms, beds, bed_type, amenities, square_feet, price, weekly_price, monthly_price, security_deposit
	 FROM listings);

-- it needed in assignment 5
alter table Room add primary key (listing_id);

  ALTER TABLE Room 
  ADD FOREIGN  KEY (listing_id) REFERENCES Listings(id);
  
  ALTER TABLE Listings 
  DROP COLUMN accommodates,
  DROP COLUMN bathrooms,
  DROP COLUMN bedrooms,
  DROP COLUMN beds,
  DROP COLUMN bed_type,
  DROP COLUMN amenities,
  DROP COLUMN square_feet;