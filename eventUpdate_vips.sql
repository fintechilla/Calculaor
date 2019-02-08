/*show processlist;

*/
use task_crud;
drop event if exists update_vips;
create event update_vips
	on schedule every 1 minute
    do call UpdateVipLevels();