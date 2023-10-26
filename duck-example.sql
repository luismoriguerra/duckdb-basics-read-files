duckdb

create table ducks as select 3 as age,'mandarin' as breed;

show tables;

from ducks;

-- to create duckdb 
duckdb duck-example.db

duckdb duck-example.db -readonly

duckdb

.open duck-example.db