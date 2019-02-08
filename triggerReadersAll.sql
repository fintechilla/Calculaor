/*INSERT */
drop trigger if exists readers_insert;
delimiter $$
create trigger readers_insert after insert on readers
for each row
begin
	insert into readers_aud (event_date, event_type, new_reader_id, new_firstname, new_lastname, new_peselid,
    new_vip_level) 
    values (curtime(), "INSERT", new.reader_id, new.firstname, new.lastname, new.peselid, new.vip_level);
end $$
delimiter ;

/*DELETE */
drop trigger if exists readers_delete;
delimiter $$
create trigger readers_delete after delete on readers
for each row 
begin
	insert into readers_aud (event_date, event_type, old_reader_id, old_firstname, old_lastname, 
    old_peselid, old_vip_level)
    values (curtime(), "DELETE", old.reader_id, old.firstname, old.lastname, old.peselid, old.vip_level);
end $$
delimiter ;

/*UPTADE */
drop trigger if exists readers_update;
delimiter $$
create trigger readers_update after update on readers
for each row
begin
	insert into readers_aud (event_date, event_type, new_reader_id, new_firstname, new_lastname, new_peselid, new_vip_level, 
    old_reader_id, old_firstname, old_lastname, old_peselid, old_vip_level)
    values(curtime(), "UPDATE", new.reader_id, new.firstname, new.lastname, new.peselid, new.vip_level, 
    old.reader_id, old.firstname, old.lastname, old.peselid, old.vip_level);
end $$

delimiter ;
