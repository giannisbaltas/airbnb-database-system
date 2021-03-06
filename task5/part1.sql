CREATE TABLE Amenity AS
(SELECT DISTINCT unnest(amenities::text[]) AS amenity_name FROM Room );
 
ALTER  TABLE Amenity
ADD COLUMN amenity_id SERIAL PRIMARY KEY;

CREATE TABLE Room_Amenity (
	listing_id int,
	amenity_id int
);

ALTER TABLE Room_Amenity
ADD amenity_name VARCHAR(550);

INSERT INTO Room_Amenity(listing_id,amenity_name)
SELECT Room.listing_id,unnest(amenities::text[]) AS amenity_name 
FROM Room;

UPDATE Room_Amenity
SET  amenity_id = Amenity.amenity_id
FROM Amenity
WHERE Room_Amenity.amenity_name = Amenity.amenity_name;	

ALTER TABLE Listing DROP COLUMN amenities;

--ALTER TABLE Room_Amenity ADD PRIMARY KEY(listing_id,amenity_id);

ALTER TABLE Room_Amenity
ADD FOREIGN KEY(listing_id) REFERENCES Listing(id),
ADD FOREIGN KEY(amenity_id) REFERENCES Amenity(amenity_id);