explain select * from books where title like '%The%';
create index title_index on books(TITLE);
explain select * from books where title like '%The%';
select * from books where title like '%The%';

EXPLAIN select * from readers where firstname = "John";
create index names_index on readers(firstname, lastname);
EXPLAIN select * from readers where firstname = "John";
SELECt * from readers where firstname = "John";