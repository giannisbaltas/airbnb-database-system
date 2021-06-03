
/*delete duplicates*/

--credits
ALTER TABLE CREDITS ADD COLUMN TEMP SERIAL;

DELETE FROM Credits
WHERE temp IN
    (SELECT temp
    FROM 
        (SELECT temp,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY  id DESC ) AS row_num
        FROM Credits ) t
        WHERE t.row_num > 1 );

ALTER TABLE CREDITS DROP COLUMN TEMP;

--keywords
ALTER TABLE keywords ADD COLUMN TEMP SERIAL;

DELETE FROM keywords
WHERE temp IN
    (SELECT temp
    FROM 
        (SELECT temp,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY  id DESC ) AS row_num
        FROM keywords ) t
        WHERE t.row_num > 1 );

ALTER TABLE keywords DROP COLUMN TEMP;

-- movies_metadata
ALTER TABLE movies_metadata ADD COLUMN TEMP SERIAL;

DELETE FROM movies_metadata
WHERE temp IN
    (SELECT temp
    FROM 
        (SELECT temp,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY  id DESC ) AS row_num
        FROM movies_metadata ) t
        WHERE t.row_num > 1 );

ALTER TABLE movies_metadata DROP COLUMN TEMP;


-- add primary keys
ALTER TABLE CREDITS ADD PRIMARY KEY(id);  
ALTER TABLE movies_metadata ADD PRIMARY KEY(id);  
ALTER TABLE keywords ADD PRIMARY KEY(id);

/* delete movies that not exist in movies_metadata*/

-- between ratings_small and movies_metadata

delete from Ratings_small where movie_id not in(select id from movies_metadata);

/*create table for_delete as (SELECT movie_id 
FROM Ratings_small
WHERE movie_id NOT IN (SELECT id FROM movies_metadata));

DELETE 
FROM ratings_small o
USING for_delete u
WHERE o.movie_id = u.movie_id;*/

-- between links and movies_metadata
/*SELECT movie_id 
FROM links
WHERE movie_id NOT IN (SELECT id FROM movies_metadata)
-- 38208 rows affected.*/

delete from links where movie_id not in(select id from movies_metadata); -- 38208 rows affected.


-- add foreign keys 
ALTER TABLE Keywords add FOREIGN KEY (id) REFERENCES Movies_Metadata(id);
ALTER TABLE Links add FOREIGN KEY (movie_id) REFERENCES Movies_Metadata(id);
ALTER TABLE Ratings_small add FOREIGN KEY (movie_id) REFERENCES Movies_Metadata(id);
ALTER TABLE credits add FOREIGN KEY (id) REFERENCES Movies_Metadata(id);

-- because we will work with mm instead movies_metadata
ALTER TABLE Keywords add FOREIGN KEY (id) REFERENCES mm(id);
ALTER TABLE Links add FOREIGN KEY (movie_id) REFERENCES mm(id);
ALTER TABLE Ratings_small add FOREIGN KEY (movie_id) REFERENCES mm(id);
ALTER TABLE credits add FOREIGN KEY (id) REFERENCES mm(id);


