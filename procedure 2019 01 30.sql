drop procedure if exists UpdateVipLevels;

delimiter $$

create procedure UpdateVipLevels()
begin
	declare booksread int;
    declare days int;
    declare booksPerMonth decimal(5,2);
    
    select count(*) from rents
    where reader_id = 3
    into booksread;
    
    select datediff(max(rent_date), min(rent_date)) from rents
    where reader_id = 3
    into days;
    
    set bookspermonth = booksread / days * 30;
    
    select booksread, days, bookspermonth;
end $$

delimiter ;
call UpdateVipLevels();
