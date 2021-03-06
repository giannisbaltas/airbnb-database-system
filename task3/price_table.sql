create table Price as(select distinct id as listing_id,price,weekly_price,monthly_price,
		security_deposit,cleaning_fee,guests_included,extra_people,minimum_nights,maximum_nights,
		minimum_minimum_nights,maximum_minimum_nights,minimum_maximum_nights,maximum_maximum_nights,minimum_nights_avg_ntm,maximum_nights_avg_ntm					  
from listings);

ALTER TABLE Price 
alter column price TYPE numeric USING price::numeric,
alter column weekly_price TYPE numeric USING price::numeric,
alter column monthly_price TYPE numeric USING price::numeric,
alter column security_deposit TYPE numeric USING price::numeric,
alter column cleaning_fee TYPE numeric USING price::numeric,
alter column extra_people TYPE numeric USING price::numeric;

update Price 
set 
price = replace(price,'$',''),
weekly_price = replace(weekly_price,'$',''),
monthly_price = replace(monthly_price,'$',''),
security_deposit = replace(security_deposit,'$',''),
cleaning_fee = replace(cleaning_fee,'$',''),
extra_people = replace(extra_people,'$','');

update Price 
set 
price = replace(price,',',''),
weekly_price = replace(weekly_price,',',''),
monthly_price = replace(monthly_price,',',''),
security_deposit = replace(security_deposit,',',''),
cleaning_fee = replace(cleaning_fee,',',''),
extra_people = replace(extra_people,',','');

alter table Price
add foreign key (listing_id) references Listings(id);

  ALTER TABLE Listings 
  DROP COLUMN price,
  DROP COLUMN weekly_price,
  DROP COLUMN monthly_price,
  DROP COLUMN security_deposit,
  DROP COLUMN cleaning_fee,
  DROP COLUMN guests_included,
  DROP COLUMN extra_people,
  DROP COLUMN minimum_nights,
  DROP COLUMN maximum_nights,
  DROP COLUMN minimum_minimum_nights,
  DROP COLUMN maximum_minimum_nights,
  DROP COLUMN minimum_maximum_nights,
  DROP COLUMN maximum_maximum_nights,
  DROP COLUMN minimum_nights_avg_ntm,
  DROP COLUMN maximum_nights_avg_ntm;