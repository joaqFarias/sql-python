# create database friends;
# luego se importa el script del codgin dojo...

select concat(users.first_name,' ', users.last_name) as users, concat(friend.first_name,' ', friend.last_name) as friends 
from users left join friendships on users.id = friendships.user_id
join users as friend on  friendships.friend_id = friend.id;

# 1. Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.

select concat(users.first_name,' ', users.last_name) as users, concat(friend.first_name,' ', friend.last_name) as friends 
from users left join friendships on users.id = friendships.user_id
join users as friend on  friendships.friend_id = friend.id
where friend.first_name = 'Kermit';

# 2. Devuelve el recuento de todas las amistades.

select concat_ws(' ', users.first_name, users.last_name) as users, concat_ws(' ', friend.first_name, friend.last_name) as friends 
from users join friendships on users.id = friendships.user_id
join users as friend on  friendships.friend_id = friend.id
union 
select concat_ws(' ', users.first_name, users.last_name) as users, concat_ws(' ', friend.first_name, friend.last_name) as friends 
from users as friend join friendships on friend.id = friendships.user_id
join users on  friendships.friend_id = users.id;

# 3. Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

select concat_ws(' ', users.first_name, users.last_name) as users, count(concat_ws(' ', friend.first_name, friend.last_name)) as friends
from users join friendships on users.id = friendships.user_id
join users as friend on  friendships.friend_id = friend.id
group by users.id
union 
select concat_ws(' ', users.first_name, users.last_name) as users, count(concat_ws(' ', friend.first_name, friend.last_name)) as friends
from users as friend join friendships on friend.id = friendships.user_id
join users on  friendships.friend_id = users.id
group by users.id;

# 4. Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.

insert into users (first_name, last_name) values ('Benjamin', 'Farias')
insert into friendships

# 5. Devuelve a los amigos de Eli en orden alfabético.

select concat_ws(' ', users.first_name, users.last_name) as users, concat_ws(' ', friend.first_name, friend.last_name) as friends
from users join friendships on users.id = friendships.user_id
join users as friend on  friendships.friend_id = friend.id
where users.first_name = 'Eli' 
order by friends;

# 6. Eliminar a Marky Mark de los amigos de Eli.

delete from friendships 

# 7. Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos