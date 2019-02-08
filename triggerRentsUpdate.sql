drop trigger if exists rents_update;

delimiter $$
create trigger rents_update after update on rents
for each row
begin
	insert into rents_aud (event_date, event_type, rent_id, new_book_id, new_reader_id, new_rent_date, 
    new_return_date, old_book_id, old_reader_id, old_rent_date, old_return_date)
    values(curtime(), "UPDATE", old.rent_id, new.book_id, new.reader_id, new.rent_date, 
    new.return_date, old.book_id, old.reader_id, old.rent_date, old.return_date);
end $$

delimiter ;
