drop trigger if exists rents_insert;
delimiter $$
create trigger rents_insert after insert on rents
for each row
begin
	insert into rents_aud(event_date, event_type, rent_id, 
    new_book_id, new_reader_id, new_rent_date, new_return_date)
    values(curtime(), "INSERT", new.rent_id, new.book_id, new.reader_id, new.rent_date, new.return_date);
    
    END $$
    
    delimiter ;
    
