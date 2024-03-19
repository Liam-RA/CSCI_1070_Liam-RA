1.
Alter table rental
add status 

insert into rental (status)
values 
(case 
	when return_date - rental_date > rental_duration then late
	when return_date - rental_date < rental_duration then early
	else on_time
end)


2. 
select sum(amount),p.customer_id
from payment as p
left join customer as c
on p.customer_id = c.customer_id
left join address as a
on c.address_id = a.address_id
where district = 'Missouri' --I couldn't find anything more specific than that for deciphering Kansas city & Saint Louis
group by p.customer_id

3.
select name, count(title)
from film as f
left join film_category as fc
on f.film_id = fc.film_id
left join category as c
on fc.category_id = c.category_id
group by name

4.
-- I'm not fully sure, the cardinality does not reveal anything
--as the connection of fc-to-c and f-to-fc is mirrored/the same
--The only real difference I can tell is the information stored in the table

5.
select f.film_id,title,length
from film as f
left join inventory as i 
on f.film_id = i.film_id
left join rental as r
on i.inventory_id = r.inventory_id
where return_date
between '2005-05-15' and '2005-05-31'

6.
select title
from film as f
left join inventory as i 
on f.film_id = i.film_id
left join rental as r
on i.inventory_id = r.inventory_id
left join payment as p
on r.rental_id = p.rental_id
where amount < (select avg(amount) from payment)

7.
select count(status)
from rental 
group by status

8.
select title,length,
(percent_rank() over(order by length)) as percent_rank
from film

9a.
explain select title,length,
(percent_rank() over(order by length)) as percent_rank
from film
-- The window/precent_rank is an aggregate that the sorting based on film.length

9b.
explain select name, count(title)
from film as f
left join film_category as fc
on f.film_id = fc.film_id
left join category as c
on fc.category_id = c.category_id
group by name
-- The query is first hash join f,fc, & c, then gouping by c.name

-- The queries work differently, in the first one, a window function using an agg that essentially sorts based on film length
-- In the second one, joins the tables then sorts the selected columns by c.name
