drop trigger if exists rents_delete;

delimiter $$
create trigger rents_delete after delete on rents
for each row
begin
	insert into rents_aud (event_date, event_type, rent_id )
    values (curtime(), "DELETE", old.rent_id);
end $$

delimiter ;
		
