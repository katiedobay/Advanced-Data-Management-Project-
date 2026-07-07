--create trigger function
CREATE OR REPLACE FUNCTION trg_update_summary_revenue()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO summary_revenue_by_category (category_name, total_revenue)
VALUES (
NEW.category_name,
(SELECT COALESCE(SUM(payment_amount), 0)
FROM detailed_revenue_by_category
WHERE category_name = NEW.category_name)
)
ON CONFLICT (category_name)
DO UPDATE
SET total_revenue = EXCLUDED.total_revenue;

RETURN NEW;
END;
$$;
--successful
