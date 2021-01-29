INSERT INTO category(category_id, category_name) VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', 'ACTION');
INSERT INTO category(category_id, category_name) VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'Comedy');
INSERT INTO category(category_id, category_name) VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', 'Fantasy');
INSERT INTO category(category_id, category_name) VALUES('9b7b9784-5751-4210-9603-2fea139c8dd1', 'Horror');
INSERT INTO category(category_id, category_name) VALUES('604a15ab-fe9c-4c3f-9d49-a785eb4782a8', 'Thriller');


INSERT INTO langauge(language_id, "name") VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', 'English');
INSERT INTO langauge(language_id, "name") VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'Sinhala');
INSERT INTO langauge(language_id, "name") VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', 'Tamil');


INSERT INTO film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, full_text)
VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', 
       'Hotel Transylvania 2', 
       'Dracula and his friends try to bring out the monster in his in his half human. Hlaf campire grandson in order in order to keep Mavis from leaving the hotel.',
       '2016',
       '065be13b-2aef-4f09-9fd1-653cb5eae2c8',
       '7',
       '12.5',
       '120',
       '300',
       '9.9',
       'Animation, cartoon',
       '...'
       );
INSERT INTO film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, full_text)
VALUES('be36445e-824d-434e-8a4b-275226cdc179', 
       'Avengers', 
       'When Tommy Stark tries to jumpstart a darmant peacekeeping program, thing go awaay and it is up to the Avengers to stop the villaindus Ultron from enacting his terrible plans',
       '2016',
       '065be13b-2aef-4f09-9fd1-653cb5eae2c8',
       '7',
       '12.5',
       '120',
       '300',
       '9.9',
       'Marvel, movie',
       '...'
       );      
INSERT INTO film(film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, full_text)
VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', 
       'Ice Age', 
       'Manny, Diengo, and Sid join up with Buck to fend off a strike that would destroy the world.',
       '2014',
       '2b98158c-cb48-490d-89e3-67852ecef6cc',
       '7',
       '12.5',
       '120',
       '300',
       '9.9',
       'Animation, cartoon',
       '...'
       );
      
 
INSERT INTO film_category(film_id, category_id) 
VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', '065be13b-2aef-4f09-9fd1-653cb5eae2c8');    
INSERT INTO film_category(film_id, category_id) 
VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'be36445e-824d-434e-8a4b-275226cdc179');
INSERT INTO film_category(film_id, category_id) 
VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', '2b98158c-cb48-490d-89e3-67852ecef6cc');


INSERT INTO inventory(inventory_id, film_id) VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8','2b98158c-cb48-490d-89e3-67852ecef6cc');
INSERT INTO inventory(inventory_id, film_id) VALUES('be36445e-824d-434e-8a4b-275226cdc179','be36445e-824d-434e-8a4b-275226cdc179');
INSERT INTO inventory(inventory_id, film_id) VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc','065be13b-2aef-4f09-9fd1-653cb5eae2c8');


INSERT INTO actor(actor_id, first_name, last_name)
VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', 'Robert','Journey Jr');
INSERT INTO actor(actor_id, first_name, last_name)
VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'Ray','Romano');
INSERT INTO actor(actor_id, first_name, last_name)
VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', 'Dennis','John');


INSERT INTO film_actor(actor_id, film_id) VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', '2b98158c-cb48-490d-89e3-67852ecef6cc');
INSERT INTO film_actor(actor_id, film_id) VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'be36445e-824d-434e-8a4b-275226cdc179');
INSERT INTO film_actor(actor_id, film_id) VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', '065be13b-2aef-4f09-9fd1-653cb5eae2c8');


INSERT INTO country(country_id, country) VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', 'Sri Lanka');
INSERT INTO country(country_id, country) VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'India');
INSERT INTO country(country_id, country) VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', 'US');


INSERT INTO city(city_id , city, country_id ) VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', 'kandy', '065be13b-2aef-4f09-9fd1-653cb5eae2c8');
INSERT INTO city(city_id, city, country_id) VALUES('be36445e-824d-434e-8a4b-275226cdc179', 'Hydrabad', 'be36445e-824d-434e-8a4b-275226cdc179');
INSERT INTO city(city_id, city, country_id) VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', 'California', '2b98158c-cb48-490d-89e3-67852ecef6cc');


INSERT INTO address(address_id, address, address2, district, city_id, postal_code, phone)
VALUES('065be13b-2aef-4f09-9fd1-653cb5eae2c8', '55/f Kandy colombo', '55/c Kandy', 'kandy', '065be13b-2aef-4f09-9fd1-653cb5eae2c8', '20400', '0813848908');
INSERT INTO address(address_id, address, address2, district, city_id, postal_code, phone)
VALUES('be36445e-824d-434e-8a4b-275226cdc179', '53/f Kandy kandy', '23/c Kandy', 'kandy', '065be13b-2aef-4f09-9fd1-653cb5eae2c8', '20400', '0813848908');
INSERT INTO address(address_id, address, address2, district, city_id, postal_code, phone)
VALUES('2b98158c-cb48-490d-89e3-67852ecef6cc', '52/f Kandy colombo', '12/c Kandy', 'kandy', '065be13b-2aef-4f09-9fd1-653cb5eae2c8', '20400', '0813848908');




