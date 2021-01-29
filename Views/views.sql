create or replace view myview as 
	SELECT film_id, title
	FROM film f
	WHERE film_id in(
		SELECT film_id
		FROM film_category fc 
		HAVING count(film_id) > 1
	)
	INNER JOIN language l 
	ON f.language_id = l.language_id;

