DROP DATABASE IF EXISTS dvd_rental;
CREATE DATABASE dvd_rental;

CREATE USER shihara WITH PASSWORD 'classified23';
GRANT ALL PRIVILEGES ON DATABASE "dvd_rental" to shihara;
