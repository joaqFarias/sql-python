select * from users;

# insert
insert into users (first_name, last_name, handle, birthday, created_at, updated_at)
values ('Benjamin', 'Farias', 'Benjaskt', '1999-12-01', now(), now());
select * from users;

# select
select * from users where (id < 2 or id > 4) and first_name != 'Benjamin';

# update
update users set first_name = 'NosoyBenjamin', last_name = 'NiFarias'
where id > 6;
select * from users;

# delete
SET SQL_SAFE_UPDATES = 0; # 0 para poder borrar, 1 para dificultar la eliminacion de elementos. 
delete from users where first_name = 'NosoyBenjamin';
select * from users;