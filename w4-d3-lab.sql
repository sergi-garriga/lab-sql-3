use sakila;

-- How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;
			-- 121


-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id)
from film;
			-- just 1


-- How many movies were released with "PG-13" rating?
select count(rating = "PG-13")
from film;
			-- 1000 films
	


-- Get 10 the longest movies from 2006.
select * from film
where release_year = 2006
order by length
limit 10;



-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from rental;
			-- 266 days


-- Show rental info with additional columns month and weekday. Get 20.
select *, 
	date_format(rental_date, "%M") as month,
	date_format(rental_date, '%W') as weekday
from rental
limit 20;



-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
	date_format(rental_date, "%M") as month,
	date_format(rental_date, '%W') as weekday,
    case
    when date_format(rental_date, '%W') = 'Saturday' then 'weekend'
    when date_format(rental_date, '%W') = 'Sunday' then 'weekend'
    else 'workday'
    end as day_type
from rental;



-- How many rentals were in the last month of activity?
select count(*) as rental_activity
from rental
where date_format(rental_date, "%M") = 'February' and  date_format(rental_date, "%Y") = 2006;
			-- 182 rentals

