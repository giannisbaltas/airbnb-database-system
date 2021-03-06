ALTER TABLE Calendar add FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Listings add FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);

ALTER TABLE Reviews_Summary add FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Reviews add FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Listings_Summary add FOREIGN KEY (id) REFERENCES Listings(id);

ALTER TABLE Listings_Summary add FOREIGN KEY (neighbourhood) REFERENCES neighbourhoods(neighbourhood);

--ALTER TABLE Geolocation ADD PRIMARY KEY(properties_neighbourhood);

alter table geolocation add foreign key (properties_neighbourhood) references neighbourhoods(neighbourhood);