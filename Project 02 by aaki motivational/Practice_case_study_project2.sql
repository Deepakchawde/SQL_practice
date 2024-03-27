-- creating the data base and use that database alter
-- also inport the csv file from the system

create schema car_dekho 
use car_dekho;

-- Read data--
Select * from car

-- count of total record --
select count(*) from car;

-- the manager ask the employee how many cars are available in 2023 -- 
select count(name) from car
where year =2023 

select count(*) from car where year = 2023


-- the manager ask the employee how many cars are available in 2020, 2021 and 2022-- 
select count(*) from car
where year = 2020 or year = 2021 or year = 2022

select count(*) , year from car 
where year in (2020,2021,2022) 
group by year

select count(*) , year from car
group by year


-- print total numbers of cars by year dont show all details
select  count(*) , year 
from car
group by year

-- how many delers will be there in 2020
select  count(*)
from car
where fuel = "Diesel" and year = 2020


-- petrol cars in 2020
select count(*)
from car
where fuel = "Petrol" and year = 2020


-- print the data from table that contain all the fule type by years
select  count(*), year
from car
where fuel = "petrol"
group by year

select  count(*), year
from car
where fuel = "diesel"
group by year

select  count(*), year
from car
where fuel = "cng"
group by year


-- which year having the car more than 100--
select count(*), year
from car
group by year
having count(*) > 100

-- which year having the car less than 100--
select count(*), year
from car
group by year
having count(*)< 100


-- show the details of the data where car is between 2015 and 2023
select count(*)
from car
where year between 2015 and 2023

-- show all the detasis of cars between 2015 and 2023

select * 
from car
where year between 2015 and 2023