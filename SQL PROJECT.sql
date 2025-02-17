Create database airline;
Use airline;
SELECT * FROM `airline passenger satisfaction`;


#1. Find the average satisfaction score for each customer type (e.g., Business, First-Class, etc.). 
Select `Customer Type`, 
SUM(Satisfaction = "satisfied") / COUNT(*) AS AVG_SATISFACTION
From `airline passenger satisfaction`
Group By `Customer Type`;


#2. Count the total number of customers in each gender category.
SELECT Gender,
COUNT(*) AS GENDER_CATEGORY
FROM `airline passenger satisfaction`
GROUP BY `Gender`;


#3. Show the list of customers who had a flight distance greater than 1500 miles and were satisfied.
Select *
From `airline passenger satisfaction`
Where `Flight Distance` > 1500
And Satisfaction = "Satisfied";


#4. Calculate the total number of customers who had a flight with a departure delay greater than 30 minutes.
Select 
Count(*) as Count_Customer
From `airline passenger satisfaction`
Where `Departure Delay in Minutes` > 30;


#5. Find the average seat comfort rating for each class of travel.
Select Class,
Avg (`Seat comfort`)
From `airline passenger satisfaction`
Group By (class);


#6. Display the customer types with the highest average flight distance.
Select `Customer Type`,
Avg (`Flight Distance`) as AVG_flight
From `airline passenger satisfaction`
Group By `Customer Type`
Order By AVG_FLIGHT DESC
Limit 1;


#7. List the customers who had online boarding convenience greater than 4 and whose satisfaction is below 3.
SELECT `ONLINE BOARDING`
FROM `airline passenger satisfaction`
WHERE `ONLINE BOARDING` > 4 AND `satisfaction` < 3;


#8. What is the maximum and minimum baggage handling score?
Select
MAX(`Baggage handling`) as Max_Score,
MIN(`Baggage handling`) as Min_Score
From `airline passenger satisfaction`;


#9. Show the average cleanliness score for each gate location.
Select 
Avg(Cleanliness), `Gate location` 
From `airline passenger satisfaction`
Group By `Gate location`; 


#10. Find the number of customers who had inflight entertainment service ratings of less than 3.
Select`Inflight entertainment` < 3
From `airline passenger satisfaction`;


#11. Calculate the percentage of customers who experienced departure delays over 15 minutes.
SELECT 
    (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM `airline passenger satisfaction`) AS percentage_delayed
FROM `airline passenger satisfaction`
WHERE `Departure Delay in Minutes` > 15;


#12. Find the number of customers whose flight had a departure delay and also had good inflight wifi service (score > 4).
SELECT 
COUNT(*) AS COUNT
FROM `airline passenger satisfaction`
WHERE `Departure Delay in Minutes` > 0 AND `Inflight wifi service` > 4;


#13. List the customer types that rated their inflight service higher than the average inflight service rating.
SELECT 
DISTINCT(`Customer Type`)
FROM `airline passenger satisfaction`
WHERE `Inflight wifi service` > (SELECT AVG(`Inflight wifi service`) FROM `airline passenger satisfaction`);


#14. Find the highest rated inflight service by customer type.
SELECT `Customer Type`,
MAX(`Inflight service`) AS highest_rating
FROM `airline passenger satisfaction`
GROUP BY `Customer Type`;


#15. Find the average legroom service rating for customers with a flight distance less than 500 miles.
SELECT 
AVG(`Leg room service`) AS LEGROOM_RATING
FROM `airline passenger satisfaction`
WHERE `Flight Distance` < 500;


#16. What is the most common gate location for passengers who had a flight distance greater than 1000 miles?
SELECT (`Gate location`), 
COUNT(*) AS TOTAL_PASSENGER
FROM `airline passenger satisfaction`
WHERE `Flight Distance` > 1000
GROUP BY `Gate location`
Order By `TOTAL_PASSENGER`
Limit 1;


#17. Identify the number of customers who were satisfied with the check-in service (satisfaction > 4).
Select `Checkin service`
From `airline passenger satisfaction`
Where `Checkin service` > 4;


#18. Find the most popular class for customers who rated food and drink service as excellent.
SELECT class, 
COUNT(*) AS customer_count
From `airline passenger satisfaction`
WHERE `Food and drink` = 5
GROUP BY class
ORDER BY `customer_count` DESC
Limit 1;


#19. Show the total number of flights with a departure delay of more than 20 minutes and their corresponding arrival delay.
Select `Departure Delay in Minutes`, 
COUNT(*) as total_flights  
From `airline passenger satisfaction`
WHERE `Departure Delay in Minutes` > 20
GROUP BY `Departure Delay in Minutes`;


#20. Find the customer type that has the highest percentage of delayed flights (departure delay > 0 minutes).
SELECT `Customer Type`, 
COUNT(CASE WHEN `Departure Delay in Minutes` > 0 THEN 1 END) * 100.0 / COUNT(*) AS delay_percentage
From `airline passenger satisfaction`
GROUP BY `Customer Type`
ORDER BY delay_percentage DESC;









 











