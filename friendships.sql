CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_amigos` AS
    SELECT 
        CONCAT_WS(' ',
                `users`.`first_name`,
                `users`.`last_name`) AS `users`,
        CONCAT_WS(' ',
                `friend`.`first_name`,
                `friend`.`last_name`) AS `friends`
    FROM
        ((`users`
        JOIN `friendships` ON ((`users`.`id` = `friendships`.`user_id`)))
        JOIN `users` `friend` ON ((`friendships`.`friend_id` = `friend`.`id`))) 
    UNION SELECT 
        CONCAT_WS(' ',
                `users`.`first_name`,
                `users`.`last_name`) AS `users`,
        CONCAT_WS(' ',
                `friend`.`first_name`,
                `friend`.`last_name`) AS `friends`
    FROM
        ((`users` `friend`
        JOIN `friendships` ON ((`friend`.`id` = `friendships`.`user_id`)))
        JOIN `users` ON ((`friendships`.`friend_id` = `users`.`id`)));

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

select * from v_amigos;

# 3. Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

select users, count(friends) from v_amigos
group by users;

# 4. Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.

insert into users (users.first_name, users.last_name) values ('Benjamin', 'Farias');
insert into friendships (friendships.user_id, friendships.friend_id, friendships.created_at) values (6, 2, now());
insert into friendships (friendships.user_id, friendships.friend_id, friendships.created_at) values (6, 4, now());
insert into friendships (friendships.user_id, friendships.friend_id, friendships.created_at) values (6, 5, now());

# 5. Devuelve a los amigos de Eli en orden alfabético.

select * from v_amigos
where v_amigos.users = 'Eli Byers'
order by v_amigos.friends asc;

# 6. Eliminar a Marky Mark de los amigos de Eli.

delete from friendships
where user_id = 2 and friend_id = 5;

# 7. Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos

select * from v_amigos;