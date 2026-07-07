SELECT
c.customer_id,
format_customer_name(c.first_name, c.last_name) AS customer_name,
i.film_id,
cat.name AS category_name,
r.rental_date,
p.amount AS payment_amount
FROM payment p
JOIN rental AS r
ON p.rental_id = r.rental_id
JOIN customer AS c
ON r.customer_id = c.customer_id
JOIN inventory AS i
ON r.inventory_id = i.inventory_id
JOIN film_category AS fc
ON i.film_id = fc.film_id
JOIN category AS cat
ON fc.category_id = cat.category_id;
--successful 
