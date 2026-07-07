-- drop older versions
DROP FUNCTION IF EXIST format_customer_name (VARCHAR, VARCHAR);
DROP FUNCTION IF EXIST format_customer_name (TEXT, TEXT);
-- successful.

--create function
CREATE OR REPLACE FUNCTION
format_customer_name(p_first_name TEXT, p_last_name TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $func$
BEGIN
RETURN TRIM(p_first_name) || ‘ ‘ || TRIM(p_last_name);
END;
$func$;
--sucessful

--test
SELECT format_customer_name(‘Mary’, ‘Smith’) AS test_name;
--successful
