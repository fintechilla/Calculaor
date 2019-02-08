insert into rents(book_id, reader_id, rent_date, return_date) 
values(5, 3, date_add(curdate(), interval -5 day) , null);
insert into rents(book_id, reader_id, rent_date, return_date) 
values(2, 3, date_add(curdate(), interval -2 day) , null);
insert into rents(book_id, reader_id, rent_date, return_date) 
values(5, 1, date_add(curdate(), interval -9 day) , null);
insert into rents(book_id, reader_id, rent_date, return_date) 
values(4, 4, date_add(curdate(), interval -3 day) , null);
commit;