select * from category ;

-- #1
select f.title, c.name as category, f.length
from film_category fc
join film f on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where c.name = 'Comedy'
order by length
limit 10;

-- #2
select c.name, count(*) as jumlah_movie, avg(f.rental_rate) as rata_harga_sewa
from film_category fc 
join film f on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
group by c.name
order by count(*) desc;

-- #3
select f.rating, 
case 
	when f.rating = 'G' then 'General Audiences' 
    when f.rating = 'PG' then 'Parental Guidance Suggested'
    when f.rating = 'PG-13' then 'Parental Guidances for Children Under 13'
    when f.rating = 'R' then 'Restricted'
    else 'No Children Under 17 Admitted'
    end as keterangan, 
count(*) as jumlah_movie
from film f
group by f.rating
order by f.rating;

-- #4
select a.actor_id, a.first_name, a.last_name, count(*) as jumlah_movie
from actor a
join film_actor fa on fa.actor_id = a.actor_id
group by a.actor_id, a.first_name, a.last_name
order by count(*) desc;

-- #5
select c.name as category, count(*) as jumlah_movie
from film f
join film_category fc on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
join film_actor fa on fa.film_id = f.film_id
join actor a on a.actor_id = fa.actor_id
where a.actor_id = 107
group by c.name;

-- #6
select f.title, c.name as category
from film f
join film_category fc on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
join film_actor fa on fa.film_id = f.film_id
join actor a on a.actor_id = fa.actor_id
where a.actor_id = 107 and c.name = 'Sci-Fi';

-- #7
select a.actor_id, a.first_name, a.last_name, count(*) as jumlah_film
from film f
join film_category fc on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
join film_actor fa on fa.film_id = f.film_id
join actor a on a.actor_id = fa.actor_id
where c.name = 'Horror'
group by a.actor_id, a.first_name, a.last_name
order by jumlah_film desc
limit 10;

-- #8
select f.title, c.name as category
from film f
join film_category fc on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
join film_actor fa on fa.film_id = f.film_id
join actor a on a.actor_id = fa.actor_id
where a.actor_id = 27 and c.name = 'Horror'
group by f.title;






