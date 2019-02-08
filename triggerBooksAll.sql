/*INSERT */
drop trigger if exists books_insert;
delimiter $$
create trigger books_insert after insert on books
for each row
begin
	insert into books_aud (event_date, event_type, new_book_id, new_title, new_pubyear, new_bestseller) 
    values (curtime(), "INSERT", new.book_id, new.title, new.pubyear, new.bestseller);
end $$
delimiter ;

/*DELETE */
drop trigger if exists books_delete;
delimiter $$
create trigger books_delete after delete on books
for each row 
begin
	insert into books_aud (event_date, event_type, old_book_id, old_title, old_pubyear, old_bestseller )
    values (curtime(), "DELETE", old.book_id, old.title, old.pubyear, old.bestseller);
end $$
delimiter ;

/*UPTADE */
drop trigger if exists books_update;
delimiter $$
create trigger books_update after update on books
for each row
begin
	insert into books_aud (event_date, event_type, new_book_id, new_title, new_pubyear, 
    new_bestseller, old_book_id, old_title, old_pubyear, old_bestseller)
    values(curtime(), "UPDATE", new.book_id, new.title, new.pubyear, 
    new.bestseller, old.book_id, old.title, old.pubyear, old.bestseller);
end $$

delimiter ;
