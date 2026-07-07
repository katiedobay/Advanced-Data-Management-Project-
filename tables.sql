--part C
--drop previous tables
DROP TABLE IF EXISTS detailed_revenue_by_category;
DROP TABLE IF EXISTS summary_revenue_by_category;
--successful

-- create detailed table 
CREATE TABLE detailed_revenue_by_category (
detail_id SERIAL PRIMARY KEY,
customer_id INTEGER NOT NULL,
customer_name TEXT NOT NULL,
film_id INTEGER NOT NULL,
category_nameTEXT NOT NULL,
rental_dateTIMESTAMP NOT NULL,
payment_amountNUMERIC(6,2) NOT NULL
);
--successful 

-- Summary table (aggregated answer to business question)
CREATE TABLE summary_revenue_by_category (
category_nameTEXT PRIMARY KEY,
total_revenueNUMERIC(12,2) NOT NULL
);
