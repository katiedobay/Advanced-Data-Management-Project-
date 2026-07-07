--create Trigger
DROP TRIGGER IF EXISTS trg_after_insert_update_summary
ON detailed_revenue_by_category;

CREATE TRIGGER trg_after_insert_update_summary
AFTER INSERT ON detailed_revenue_by_category
FOR EACH ROW
EXECUTE FUNCTION trg_update_summary_revenue();
--successful 

--test trigger
SELECT * FROM summary_revenue_by_category;
--successful 
