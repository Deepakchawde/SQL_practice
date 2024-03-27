create database swiggy
use swiggy

select * from swiggy 

-- HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(*)
from swiggy 
where rating > 4.5

select count(distinct restaurant_name)  as high_rating
from swiggy 
where rating >4.5

-- WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city , count(*) as no_of_city
from swiggy
group by city

select city , count(distinct restaurant_name) as res_count
from swiggy 
group by city 
order by res_count desc
limit 1


-- HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select  count(restaurant_name) as pizza_restaturent
from swiggy
where restaurant_name like "%Pizza%"


-- WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select count(cuisine) as count_cuisine, cuisine
from swiggy 
group by cuisine 
order by count_cuisine desc


-- WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?-- 
select city, round(avg(rating),2) as avg_rating
from swiggy 
group by city 


-- WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name , max(price) as highest_price
from swiggy 
where menu_category = "Recommended"
group by restaurant_name

-- select restaurant_name 
-- from swiggy 
-- where price = 3429

select distinct restaurant_name, menu_category,max(price) as highestprice
from swiggy
 where menu_category='Recommended'
group by restaurant_name,menu_category;


-- FIND THE THE TOP 5 EXPENSIVE RESTATURENT THAT OFFER CUISINE OTHER THAN INDIAN CUISINE 

select distinct restaurant_name , cost_per_person
from swiggy 
where cuisine <> "Indian"
order by cost_per_person desc
limit 5

-- select distinct restaurant_name,cost_per_person
-- from swiggy where cuisine<>'Indian'
-- order by cost_per_person desc
-- limit 5;


-- FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name , cost_per_person 
from swiggy 
where cost_per_person > (select avg(cost_per_person)  from swiggy)


-- select distinct restaurant_name,cost_per_person
-- from swiggy where cost_per_person>(
-- select avg(cost_per_person) from swiggy)

-- RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select t1.restaurant_name, t1.city, t2.city
from swiggy t1
inner join swiggy t2
on t1.restaurant_name = t2.restaurant_name and t1.city<> t2.city

-- WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name , count(menu_category) as count_menu, menu_category
from swiggy 
where menu_category = "main course"
group by restaurant_name
order by count_menu desc

-- select distinct restaurant_name,menu_category
-- ,count(item) as no_of_items from swiggy
-- where menu_category='Main Course' 
-- group by restaurant_name,menu_category
-- order by no_of_items desc limit 1;

-- LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select restaurant_name 
from swiggy 
where veg_or_non-veg = "veg"


-- select distinct restaurant_name,
-- (count(case when veg_or_nonveg='Veg' then 1 end)*100/
-- count(*)) as vegetarian_percetage
-- from swiggy
-- group by restaurant_name
-- having vegetarian_percetage=100.00
-- order by restaurant_name;


-- WHICH RESTAURNANT PROVIDING THE LOWEST PRICE AVERAGE PRICE OF ALL ITEM
select distinct restaurant_name ,avg(price) as avg_price
from swiggy  
group by restaurant_name
order by avg_price

-- select distinct restaurant_name,
-- avg(price) as average_price
-- from swiggy group by restaurant_name
-- order by average_price limit 1;

-- WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select distinct restaurant_name, count(distinct menu_category) as menu_catgory
from swiggy
group by restaurant_name
order by menu_catgory desc


-- select distinct restaurant_name,
-- count(distinct menu_category) as no_of_categories
-- from swiggy
-- group by restaurant_name
-- order by no_of_categories desc limit 5;

-- WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select restaurant_name , count((veg_or_nonveg = "veg") / count(*)) *100 as per
from swiggy 
group by restaurant_name 
order by per desc


select distinct restaurant_name,
(count(case when veg_or_nonveg='Non-veg' then 1 end)*100
/count(*)) as nonvegetarian_percentage
from swiggy
group by restaurant_name
order by nonvegetarian_percentage desc limit 1;