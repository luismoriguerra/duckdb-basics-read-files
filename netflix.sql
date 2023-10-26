duckdb netflix.db 

select * from read_csv_auto('./netflix_daily_top_10.csv') limit 3;

create table netflix_daily_top_10 as from read_csv_auto('./netflix_daily_top_10.csv');

show tables;


copy netflix_daily_top_10 to 'output.csv' (HEADER, DELIMITER ',');
-- to parquet
copy netflix_daily_top_10 to 'output.parquet' (FORMAT PARQUET);

SELECT * FROM read_parquet('output.parquet');

.mode
select * from 'sales.json';

-- ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                                             sales_data                                                                             │
-- │ struct(order_id bigint, customer struct(id bigint, "name" varchar, email varchar), items struct(product_id bigint, product_name varchar, quantity bigint, price …  │
-- ├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
-- │ [{'order_id': 1, 'customer': {'id': 101, 'name': John Doe, 'email': john.doe@example.com}, 'items': [{'product_id': 301, 'product_name': Laptop, 'quantity': 1, …  │
-- └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
-- D 



.mode line
select * from 'sales.json';
-- sales_data = [{'order_id': 1, 'customer': {'id': 101, 'name': John Doe, 'email': john.doe@example.com}, 'items': [{'product_id': 301, 'product_name': Laptop, 'quantity': 1, 'price': 1200}, {'product_id': 302, 'product_name': Mouse, 'quantity': 1, 'price': 25}], 'total_amount': 1225, 'date': 2023-03-24}, {'order_id': 2, 'customer': {'id': 102, 'name': Jane Smith, 'email': jane.smith@example.com}, 'items': [{'product_id': 303, 'product_name': Keyboard, 'quantity': 1, 'price': 50}, {'product_id': 304, 'product_name': Monitor, 'quantity': 1, 'price': 200}], 'total_amount': 250, 'date': 2023-03-25}]
-- D 

show tables;

.mode markdown

from netflix_daily_top_10;

.output myfile.md

from netflix_daily_top_10;

duckdb -c "select 'helo' as msg;"

duckdb

select * From duckdb_extensions();

INSTALL httpfs;

LOAD httpfs;

-- for dev extensions 
-- duckdb -unsigned

SET s3_region='us-east-1';
create table netflix as select * from read_parquet('s3://netflix-data/parquet_data/...');

from netflix limit 3;

-- show table schema
show netflix;






