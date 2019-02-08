create table rents_aud (

	event_id int(11) not null auto_increment,
    event_date datetime not null,
    event_type varchar(10) default null,
    rent_id int(11) not null,
    old_book_id int(11),
    new_book_id int(11),
    old_reader_id int(11),
    new_reader_id int(11),
    old_rent_date datetime,
    new_rent_date datetime,
    old_return_date datetime,
    new_return_date datetime,
    primary key(event_id)
    );