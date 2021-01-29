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
    name VARCHAR(100) NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT pk_language PRIMARY KEY(language_id)
);


DROP TABLE IF EXISTS film_actor;
CREATE TABLE film_actor(
    actor_id UUID NOT NULL,
    film_id UUID NOT NULL,
    last_update TIMESTAMP DEFAULT NOW(),

    CONSTRAINT pk_film_actor PRIMARY KEY(actor_id, film_id)
);


DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory(
   inventory_id UUID NOT NULL,
   film_id UUID NOT NULL,
   store_id UUID,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_inventory PRIMARY KEY(inventory_id)
);


DROP TABLE IF EXISTS rental;
CREATE TABLE rental(
   rental_id UUID NOT NULL,
   rental_date TIMESTAMP DEFAULT NOW(),
   inventory_id UUID NOT NULL,
   customer_id UUID NOT NULL,
   return_date TIMESTAMP DEFAULT NOW(),
   staff_id UUID NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_rental PRIMARY KEY(rental_id)
);


DROP TABLE IF EXISTS payment;
CREATE TABLE payment(
   payment_id UUID NOT NULL,
   customer_id UUID NOT NULL,
   staff_id UUID NOT NULL,
   rental_id UUID NOT NULL,
   amount FLOAT NOT NULL,
   payment_date TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_payment PRIMARY KEY(payment_id)   
);


DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
   staff_id UUID NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   address VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   store_id UUID,
   active BOOLEAN NOT NULL,
   username VARCHAR(50) NOT NULL UNIQUE,
   password VARCHAR(50) NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   picture VARCHAR(256),
   
   CONSTRAINT pk_staff PRIMARY KEY(staff_id)
);

ALTER TABLE staff
ADD COLUMN address_id UUID NOT NULL;


DROP TABLE IF EXISTS actor;
CREATE TABLE actor(
   actor_id UUID NOT NULL,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_actor PRIMARY KEY(actor_id)
);


DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
   customer_id UUID NOT NULL,
   store_id UUID,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   address_id UUID NOT NULL,
   active_bool BOOLEAN NOT NULL,
   create_date TIMESTAMP DEFAULT NOW(),
   last_update TIMESTAMP DEFAULT NOW(),
   ative BOOLEAN NOT NULL,
   
   CONSTRAINT pk_customer PRIMARY KEY(customer_id)
);


DROP TABLE IF EXISTS address;
CREATE TABLE address(
   address_id UUID NOT NULL,
   address VARCHAR(100) NOT NULL,
   address2 VARCHAR(100) NOT NULL,
   district VARCHAR(100) NOT NULL,
   city_id UUID NOT NULL,
   postal_code INT NOT NULL,
   phone CHAR(10) NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT phone_number CHECK(phone LIKE '[0-9]*10'),
   CONSTRAINT pk_address PRIMARY KEY(address_id)
);


DROP TABLE IF EXISTS city;
CREATE TABLE city(
   city_id UUID NOT NULL,
   city VARCHAR(50) NOT NULL,
   country_id UUID NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_city PRIMARY KEY(city_id)
);


DROP TABLE IF EXISTS country;
CREATE TABLE country(
   country_id UUID NOT NULL,
   country VARCHAR(50) NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_country PRIMARY KEY(country_id)
);


DROP TABLE IF EXISTS store;
CREATE TABLE store(
   store_id UUID NOT NULL,
   manager_staff_id UUID NOT NULL,
   address_id UUID NOT NULL,
   last_update TIMESTAMP DEFAULT NOW(),
   
   CONSTRAINT pk_store PRIMARY KEY(store_id)
);

ALTER TABLE film_category
    ADD CONSTRAINT fk_category
    FOREIGN KEY(category_id) REFERENCES category(category_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE film_category
    ADD CONSTRAINT fk_film
    FOREIGN KEY(film_id) REFERENCES film(film_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;   

ALTER TABLE film
    ADD CONSTRAINT fk_language
    FOREIGN KEY(language_id) REFERENCES langauge(language_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;   

ALTER TABLE inventory 
    ADD CONSTRAINT fk_film
    FOREIGN KEY(film_id) REFERENCES FILM(film_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;   
  
ALTER TABLE rental
    ADD CONSTRAINT fk_customer 
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT; 

ALTER TABLE rental
    ADD CONSTRAINT fk_staff 
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT; 

ALTER TABLE rental
    ADD CONSTRAINT fk_inventory
    FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT; 
     
ALTER TABLE payment
    ADD CONSTRAINT fk_rental
    FOREIGN KEY(payment_id) REFERENCES rental(rental_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT; 

ALTER TABLE payment
    ADD CONSTRAINT fk_staff
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;   
  
ALTER TABLE payment
    ADD CONSTRAINT fk_customer
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;    

ALTER TABLE staff
	ADD CONSTRAINT fk_address
	FOREIGN KEY(address_id) REFERENCES address(address_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;    

ALTER TABLE staff
	ADD CONSTRAINT fk_store
	FOREIGN KEY(store_id) REFERENCES store(store_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;    
  
ALTER TABLE film_actor
    ADD CONSTRAINT fk_actor
    FOREIGN KEY(actor_id) REFERENCES actor(actor_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;    

ALTER TABLE film_actor
    ADD CONSTRAINT fk_film
    FOREIGN KEY(film_id) REFERENCES film(film_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT; 
    

ALTER TABLE customer
	ADD CONSTRAINT fk_address
	FOREIGN KEY(address_id) REFERENCES address(address_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT; 
   
ALTER TABLE address 
	ADD CONSTRAINT fk_city
	FOREIGN KEY(city_id) REFERENCES city(city_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;   
  
ALTER TABLE city 
	ADD CONSTRAINT fk_country
	FOREIGN KEY(country_id) REFERENCES country(country_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT; 

ALTER TABLE store 
	ADD CONSTRAINT fk_staff
	FOREIGN KEY(manager_staff_id) REFERENCES staff(staff_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT; 

ALTER TABLE store 
	ADD CONSTRAINT fk_address
	FOREIGN KEY(address_id) REFERENCES address(address_id)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;  
   
    
   
   
   