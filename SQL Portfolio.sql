--GLOBAL DATA EXPLORATION
-- Getting a general understanding of the dataset
SELECT COUNT(*)
from customer_data 

-- Looking at the gender repartition of customers
select gender, COUNT(*)
from customer_data
group by gender

--Looking at the education repartition of customers
select highest_education, COUNT(*)
from customer_data
group by highest_education

-- Now, we want to create a Customer Persona for a certain type of customer : customers whose annual incomes are higher than 60,000 € that we will call Type C customer
SELECT * 
from customer_data 
where annual_income > 60000
order by 5 ASC

-- Looking at Total number of customers compared to the number of type C customers
select COUNT (annual_income) as Total_Customers , sum(annual_income > 60000) as Type_C_Customers
from customer_data

-- EXPLORING THE DEMOGRAPHICS OF TYPE C CUSTOMERS 
-- Looking at education of type C customers
select highest_education, COUNT(*)
from customer_data
where annual_income > 60000
group by highest_education

-- Looking at gender repartition of type C customers
select gender, COUNT(*)
from customer_data
where annual_income > 60000
group by gender

-- Looking at age repartition of type C customers
select birth_year, COUNT(*)
from customer_data
where annual_income > 60000
group by birth_year
order BY 2 DESC

-- Looking at city repartition of type C customers
select city, COUNT(*)
from customer_data
where annual_income > 60000
group by city
order BY 2 DESC

-- EXPLORING THE PURCHASE BEHAVIORS OF TYPE C CUSTOMERS 
-- What products do they buy most ?
SELECT SUM(wine_spending), SUM(meat_spending), SUM(toiletries_spending), SUM(fish_spending), SUM(sweets_spending), SUM(fruits_spending)
from purchase_data
JOIN customer_data ON purchase_data.customer_id = customer_data.customer_id
WHERE annual_income > 60000

-- Through which chanel do they make their purchases ?
SELECT SUM(purchase_deals), SUM(purchase_website), SUM(purchase_catalogue), SUM(purchase_store)
from purchase_data
JOIN customer_data ON purchase_data.customer_id = customer_data.customer_id
WHERE annual_income > 60000

-- What payment method do they prefer ?
SELECT payment_methods, COUNT(*)
from customer_data
WHERE annual_income > 60000
GROUP BY payment_methods

-- EXPLORING THE CHANNEL AND CAMPAIGN BEHAVIORS OF TYPE C CUSTOMERS 
-- How much time do they spend on the different channels ?
SELECT AVG(website_visits), AVG(time_website), AVG(time_store)
from channel_performance_data
JOIN customer_data ON channel_performance_data.customer_id = customer_data.customer_id
WHERE annual_income > 60000

-- Which social media campaign were the most succesful ?
SELECT sum(campaign_a), sum(campaign_b), sum(campaign_c), sum(campaign_d), sum(campaign_e), sum(campaign_f)
from campaign_response_data
JOIN customer_data ON campaign_response_data.customer_id = customer_data.customer_id
WHERE annual_income > 60000