CREATE TABLE Movies_Metadata(
	adult boolean,
	belongs_to_collection text,
	budget int,
	genres text,
	homepage varchar(1000),
	id int ,
	imdb_id varchar(50),
	original_language varchar(20),
	original_title varchar(1000),
	overview varchar(50000),
	popularity float ,
	poster_path varchar(1000),
	production_companies text,
	production_countries text,
	release_date date,
	revenue bigint,
	runtime float ,
	spoken_languages text,
	status varchar(20) ,
	tagline varchar(1000),
	title varchar(50000),
	video boolean ,
	vote_average float,
	vote_count int
);

update movies_metadata
set 
genres =  replace(genres,E'\'', E'\"');

alter table movies_metadata alter column genres type text using genres::JSON;




	