drop procedure if exists UpdateVipLevels;

delimiter $$

create procedure UpdateVipLevels()
begin
	declare booksread, days, rdr_id int;
    declare bookspermonth decimal(5,2);
    declare finished boolean default false;
    
    declare all_readers cursor for select reader_id from readers;
    declare continue handler for not found set finished  = true;
    open all_readers;
    
    while (not finished ) do
		fetch all_readers into rdr_id;
        if (not finished) then
			select count(*) from rents
            where reader_id = rdr_id
            into booksread;
            select datediff(max(rent_date), min(rent_date))
            + 1 from rents 
            where reader_id = rdr_id
            into days;
			set bookspermonth = booksread/days*30;
            update readers set Vip_Level = VipLevel(bookspermonth)
            where reader_id = rdr_id;
            commit;
		end if;
	end while;
    close all_readers;
end $$

delimiter ;


