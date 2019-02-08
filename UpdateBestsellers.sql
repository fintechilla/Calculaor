drop procedure if exists UpdateBestsellers;
delimiter $$

create procedure UpdateBestsellers() 
begin
	declare finished boolean default false;
	declare id int;
    declare no_books int;
    
    declare bookIds cursor for select book_id from books;
    declare continue handler for not found set finished  = true;
    open bookIds;
    
    while (not finished ) do
		fetch bookIds into id;
        if (not finished) then
			select count(book_id) from rents
			where book_id = id
			into no_books;
			if (no_books >=2) then
				update books set bestseller = true where book_id = id;
			else 
				update books set bestseller = false where book_id = id;
			end if;
		end if;
	end while;
    commit;
    close bookIds;
    
end $$
delimiter ;

/*call UpdateBestsellers();

select *  from books;
*/