--1.
--select first_name,last_name 
--from customer
--where last_name like 'T%'
--order by first_name

--2.
--select * from rental
--where rental_date between '2005-05-28' and '2005-06-01'

--3.
--select title, count(inventory_id)
--from rental
--left join film
--on rental.rental_id = film.film_id
--group by inventory_id,title
--order by count DESC
--limit 10

--4.
--select customer_id,sum(amount)
--from payment
--group by customer_id
--order by customer_id 

--5.
--select first_name,last_name,count(actor.actor_id) as NumOfMovies
--from actor
--left join film_actor
--on actor.actor_id = film_actor.actor_id
--left join film
--on film_actor.film_id = film.film_id
--group by actor.actor_id
--order by NumOfMovies DESC

--6.
--A. explain select customer_id,sum(amount) from payment group by customer_id order by customer_id
--B. explain select name,avg(rental_rate) from category as c left join film_category as fc on c.category_id = fc.category_id left join film as f on fc.film_id = f.film_id group by name

--A. "Sort  (cost=362.06..363.56 rows=599 width=34)"
--"  Sort Key: customer_id"
--"  ->  HashAggregate  (cost=326.94..334.43 rows=599 width=34)"
--"        Group Key: customer_id"
--"        ->  Seq Scan on payment  (cost=0.00..253.96 rows=14596 width=8)"
--The cost refers to time to excute, rows referes to # of rows returned, width refers to # of bytes
--Sort ket refers to how the previous result is sorted, group key seems to be doing it's own operation

--B."HashAggregate  (cost=138.81..139.01 rows=16 width=100)"
--"  Group Key: c.name"
--"  ->  Hash Left Join  (cost=111.86..133.81 rows=1000 width=74)"
--"        Hash Cond: (fc.film_id = f.film_id)"
--"        ->  Hash Right Join  (cost=1.36..20.67 rows=1000 width=70)"
--"              Hash Cond: (fc.category_id = c.category_id)"
--"              ->  Seq Scan on film_category fc  (cost=0.00..16.00 rows=1000 width=4)"
--"              ->  Hash  (cost=1.16..1.16 rows=16 width=72)"
--"                    ->  Seq Scan on category c  (cost=0.00..1.16 rows=16 width=72)"
--"        ->  Hash  (cost=98.00..98.00 rows=1000 width=10)"
--"              ->  Seq Scan on film f  (cost=0.00..98.00 rows=1000 width=10)"
--cost referes to the same things as previously stated, same with rows and width.
--the hash is a value generated based on the condition corrosponding to that line
--a unique condition is generated for each operation in the origional query, plus some background logic
--seq scan is a sequential scan on a column.


--7.
--select name,avg(rental_rate)
--from category as c
--left join film_category as fc
--on c.category_id = fc.category_id
--left join film as f
--on fc.film_id = f.film_id
--group by name

--8.
--select name,count(r.rental_id),sum(amount)
--from payment as p
--left join rental as r
--on p.rental_id = r.rental_id
--left join inventory as i
--on r.inventory_id = i.inventory_id
--left join film as f 
--on i.film_id = f.film_id
--left join film_category as fc
--on f.film_id = fc.film_id
--left join category as c
--on fc.category_id = c.category_id
--group by name 
--order by count DESC
--limit 5
