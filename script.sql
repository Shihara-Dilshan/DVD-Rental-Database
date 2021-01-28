CREATE TABLE category(
    category_id UUID NOT NULL,
    category_name VARCHAR(50) NOT NULL UNIQUE, 
    last_update TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT pk_category PRIMARY KEY(category_id)
);  

CREATE TABLE film_category(
    film_id UUID NOT NULL,
    category_id UUID NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT pk_film_category PRIMARY KEY(film_id, category_id)
);


