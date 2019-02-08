use task_crud;
drop event if exists bestsellers_update;
delimiter $$
create event bestsellers_update 
	on schedule every 1 minute
    do
		begin
			declare bestsellersObject int (11);
			call UpdateBestsellers();
			select * from bestsellers_count into bestsellersObject;
			insert into stats (stat_date, stat, value) values (curtime(), "BESTSELLERS", bestsellersObject);
			select bestseller;
		end $$
delimiter ;

			