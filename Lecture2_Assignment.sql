# SQL

# Lecture2_Assignment

# W3schools 在线练习

use sakila;

show full tables;

# 1. What product names are included in order ID 10250?

SELECT b.ProductName
FROM OrderDetails a
left join Products b
on a.ProductID = b.ProductID
Where a.OrderID = 10250;

# 2. What products are contained in category 'Dairy Products'?

SELECT *
FROM Products a
left join Categories b
on a.CategoryID = b.CategoryID
Where b.CategoryName = 'Dairy Products'
order by ProductID


# MySQL sakila 查询练习


# 1. Which actors have the first name 'Scarlett'?

Select *
from actor
where first_name = 'Scarlett';

# 2. Which actors have the last name 'Johansson'

Select *
from actor
where last_name = 'Johansson';

# 3. How many distinct actors last names are there?

Select count(distinct last_name)
from actor;

# 4. Which last names appear more than once?

Select last_name, count(distinct first_name) as 'no_first_name'
from actor
group by last_name
having count(distinct first_name) > 1
order by 2 desc;

# 5. How many total rentals occured in May?

select count(rental_id) as 'Ttl_rentals_in_May'
from rental
where rental_date between '2005-05-01' and '2005-05-31';

# 6. How many staff processed rentals in May?

select count(distinct staff_id) as 'Staff_in_May'
from rental
where rental_date between '2005-05-01' and '2005-05-31';

# 7. Which staff processed the most rentals in May?

select staff_id, count(rental_id)
from rental
where rental_date between '2005-05-01' and '2005-05-31'
group by staff_id;

# 8. Which customer paid the most rental in August?

# Result : 148 Eleanor Hunt 87.82

select a.customer_id, a.first_name, a.last_name, sum(b.amount) as 'Total_Payment'
from customer a
left join payment b
on a.customer_id = b.customer_id
where b.payment_date between '2005-08-01' and '2005-08-31'
group by a.customer_id
order by 4 desc;

# 9. A summary of rental total amount by month.

Select MONTH(payment_date) as Month, sum(amount) as Total_Payment
from payment
group by 1
Order by 1;

# 10. Which actor has appeared in the most films? （Try to use SET keyboard）

select b.first_name, b.last_name, count(distinct a.film_id) as no_of_films
# 表格命名 空格加名字
from film_actor a
join actor b
on a.actor_id = b.actor_id
group by a.actor_id
order by 3 desc;

# 11. Use JOIN to display the first and last names, as well as the address, of each staff member. 
# Use the tables staff and address.

select a.first_name, a.last_name, b.address
from staff a
join address b
on a.address_id = b.address_id

# 12. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.

Select a.film_id, a.title, count(b.actor_id) as no_of_actors
from film a
join film_actor b
on a.film_id = b.film_id
group by 1;

# 13. How many copies of the film Hunchback Impossible exist in the inventory system?

# Result: 6

select count(a.inventory_id) as no_of_HI_copies
from inventory a
left join film b
on a.film_id = b.film_id
where b.title = 'Hunchback Impossible';

# 14. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:

Select a.customer_id, a.first_name, a.last_name, sum(b.amount) as Sum_of_Amount
From customer a
left join payment b
on a.customer_id = b.customer_id
group by 1
order by 3;





