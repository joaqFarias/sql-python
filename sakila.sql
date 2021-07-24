# 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? Su consulta debe devolver
# el nombre, apellido, correo electrónico y dirección del cliente.

select address.city_id, customer.first_name, customer.last_name, customer.email, address.address 
from customer join address on customer.address_id = address.address_id
where city_id = 312;

# 2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la
# película, la descripción, el año de estreno, la calificación, las características especiales y el género
# (categoría).

select film.title description, film.release_year, film.special_features, category.name 
from film join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Comedy';

# 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la 
# identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

select actor.actor_id, actor.first_name, actor.last_name, film.film_id, film.title, film.description, 
film.release_year
from film join film_actor on film.film_id = film_actor.film_id
join actor on actor.actor_id = film_actor.actor_id
where actor.actor_id = 5; 

# 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades 
# (1, 42, 312 y 459)? Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select address.city_id, address.city_id, customer.first_name, customer.last_name, customer.email, address.address
from customer join store on customer.store_id = store.store_id
join address on address.address_id = customer.address_id
where customer.store_id = 1 
and (address.city_id = 1 or address.city_id = 42 or address.city_id = 312 or address.city_id = 459);

# 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y 
# "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe devolver el título de 
# la película, la descripción, el año de lanzamiento, la calificación y la función especial.
# Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.



# 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? Su consulta debe 
# devolver film_id, title, actor_id y actor_name.

# 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
# las características especiales y el género (categoría).

# 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? Su consulta
# debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características 
# especiales, el género (categoría) y el nombre y apellido del actor.