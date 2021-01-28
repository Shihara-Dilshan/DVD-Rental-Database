DROP TABLE IF EXISTS category;
CREATE TABLE category(
    category_id UUID NOT NULL,
    category_name VARCHAR(50) NOT NULL UNIQUE, 
    last_update TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT pk_category PRIMARY KEY(category_id)
);  


DROP TABLE IF EXISTS film_category;
CREATE TABLE film_category(
    film_id UUID NOT NULL,
    category_id UUID NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT pk_film_category PRIMARY KEY(film_id, category_id)
);


DROP TABLE IF EXISTS film;
CREATE TABLE film(
    film_id UUID NOT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(256) NOT NULL,
    release_year INT NOT NULL,
    language_id UUID NOT NULL,
    rental_duration INT NOT NULL,
    length FLOAT NOT NULL,
    replacement_cost FLOAT NOT NULL,
    rating FLOAT NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),
    special_features VARCHAR(256),
    full_text VARCHAR(256),
    
    CONSTRAINT pk_film PRIMARY KEY(film_id),
    CONSTRAINT format_year CHECK(release_year BETWEEN 1800 AND 3000) 
);


DROP TABLE IF EXISTS langauge;
CREATE TABLE langauge(
    language_id UUID NOT NULL,
    film_id UUID NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT pk_language PRIMARY KEY(language_id, film_id)
);


DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory(
   
    
);



