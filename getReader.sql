drop function if exists getReader;
delimiter $$
create function getReader(id int) returns varchar(256) not deterministic
begin
	declare first_name varchar(256);
    declare last_name varchar(256);
    declare pesel_id varchar(256);
     
	if id <= 0 then
        return 'Error: id less than equal to 0';
    else
		set first_name = (select distinct firstname from readers where reader_id = id);
		set pesel_id = (select distinct peselid from readers where reader_id = id);
        set last_name = (select distinct lastname from readers where reader_id = id);
		return concat(id, ' ',first_name, ' ', last_name, ' ',pesel_id);
	end if;
end $$
delimiter ;
select getReader(2) as Reader;
