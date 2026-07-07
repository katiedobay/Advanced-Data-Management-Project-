--create procedure
CREATE OR REPLACE PROCEDURE refresh_revenue_report()
LANGUAGE plpgsql
AS $$
BEGIN
TRUNCATE TABLE summary_revenue_by_category;
TRUNCATE TABLE detailed_revenue_by_category;
INSERT INTO detailed_revenue_by_category
(customer_id, customer_name, film_id, category_name, rental_date, payment_amount)
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
JOIN category cat
ON fc.category_id = cat.category_id;
END;
$$;
--successful 
