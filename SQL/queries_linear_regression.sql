#1. Create a database called house_price_regression.

create database house_price_regression;

#Create a table house_price_data with the same columns as given in the csv file. Please make sure you use the correct data types for the columns.

drop table house_price_data;

create table house_price_data(
id bigint not null,
date datetime not null,
bedrooms int(11),
bathrooms float(11),
sqft_living int(11),
sqft_lot int(11),
floors float(11),
waterfront int(11),
view_ int(11),
condition_ int(11),
grade int(11),
sqft_above int(11),
sqft_basement int(11),
yr_built int(11),
yr_renovated int(11),
zipcode int(11),
lat float(11),
long_ float (11),
sqft_living15 int(11),
sqft_lot15 int(11),
price bigint (11),
primary key(id)
);

#4 .Select all the data from table house_price_data to check if the data was imported correctly
select * from house_price_data;
 

#Side Note: there are some duplicated ids (177), therefore sql didn't allow me to import the whole dataset, since the ids are set as primary key, therefore does not allow duplicates. Since the number of missing ids are very small compared to the whole dataframe, I worked with what was imported.


#5. Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.

alter table house_price_data
drop column date;

select * from house_price_data
limit 10;

#6. Use sql query to find how many rows of data you have.

select count(*) from house_price_data;

#7. Now we will try to find the unique values in some of the categorical columns:

# What are the unique values in the column bedrooms?
select distinct bedrooms
from house_price_data
order by bedrooms;

# What are the unique values in the column bathrooms?

select distinct bathrooms
from house_price_data
order by bathrooms;

# What are the unique values in the column floors?
select distinct floors
from house_price_data
order by floors;

# What are the unique values in the column condition?
select distinct condition_
from house_price_data
order by condition_;

# What are the unique values in the column grade?
select distinct grade
from house_price_data
order by grade;

#8. Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.

select id, price
from house_price_data
order by price desc
limit 10;


#9. What is the average price of all the properties in your data?

select round(avg(price),2) as AVG_price
from house_price_data;


#10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data:

# What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.

select bedrooms, round(avg(price),2) as AVG_house_price
from house_price_data
group by bedrooms;



#What is the average sqft_living of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.

select bedrooms, round(avg(sqft_living),2) as AVG_house_surface
from house_price_data
group by bedrooms;


#What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.

select waterfront, round(avg(price),2) as AVG_house_price
from house_price_data
group by waterfront;


#Is there any correlation between the columns condition and grade? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.

select grade, condition_, round(avg(price),2) as AVG_house_price 
from house_price_data
group by grade, condition_
order by AVG_house_price desc;




#11. One of the customers is only interested in the following houses:

    #Number of bedrooms either 3 or 4
    #Bathrooms more than 3
    #One Floor
    #No waterfront
    #Condition should be 3 at least
    #Grade should be 5 at least
    #Price less than 300000

#For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?

select *
from house_price_data
where bathrooms >3 and (bedrooms = 3 or bedrooms = 4) and floors = 1 and waterfront = 0 and condition_ >= 3
and grade >= 5 and price < 300000
;

#12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.

select * from house_price_data
where price > (select round(avg(price),2)
from house_price_data) * 2
order by price desc;

#13. Since this is something that the senior management is regularly interested in, create a view of the same query.

create view 2xabove_AVG as
select * from house_price_data
where price > (select round(avg(price),2)
from house_price_data) * 2
order by price desc;

#14. Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?

select bedrooms, round(avg(price),2) as AVG_house_price
from house_price_data
where bedrooms = 3 or bedrooms = 4
group by bedrooms;


#15. What are the different locations where properties are available in your database? (distinct zip codes)

select zipcode, round(avg(price),2) as AVG_house_price
from house_price_data
group by zipcode
order by AVG_house_price;


#16. Show the list of all the properties that were renovated.
select *
from house_price_data
where yr_renovated > 0
order by yr_renovated desc;

#17. Provide the details of the property that is the 11th most expensive property in your database.
with cte_expensive_properties as (
select *
from house_price_data
order by price DESC
LIMIT 11
)
select *
from cte_expensive_properties
order by price ASC
LIMIT 1;

