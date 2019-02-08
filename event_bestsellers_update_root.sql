use task_crud;
drop event bestsellers_update_root;
delimiter $$
create event bestsellers_update_root 
	on schedule every 1 minute
    do
		begin
			call UpdateBestsellers();
            insert into stats (stat_date, stat, value) 
            values (curdate(), "BESTSELLERS", bestsellers_count);
            select bestseller;
		end $$
delimiter ;
			