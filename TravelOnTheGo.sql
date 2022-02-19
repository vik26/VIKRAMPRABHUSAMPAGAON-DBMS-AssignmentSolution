CREATE DATABASE TravelOnTheGo;

USE TravelOnTheGo;

CREATE TABLE PASSENGER (Passenger_name varchar (50),
 Category varchar (50),
 Gender varchar (50),
 Boarding_City varchar (50),
 Destination_City varchar (50),
 Distance int primary key,
 Bus_Type varchar (50)
);

CREATE TABLE PRICE (
 Bus_Type varchar (50),
 Distance int ,
FOREIGN KEY(Distance) REFERENCES PASSENGER(Distance),
 Price int PRIMARY KEY
 );
 
 INSERT into PASSENGER values("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
 INSERT into PASSENGER values("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700, "Sitting");
 INSERT into PASSENGER values("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
 INSERT into PASSENGER values("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
 INSERT into PASSENGER values("Udit", "Non-AC", "M", "Trivandrum", "panaji", 1000, "Sleeper");
 INSERT into PASSENGER values("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500, "Sitting");
 INSERT into PASSENGER values("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
 INSERT into PASSENGER values("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
 INSERT into PASSENGER values("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

INSERT into PRICE values("Sleeper", 350, 770);
INSERT into PRICE values("leeper", 500, 1100);
INSERT into PRICE values("Sleeper", 600, 1320);
INSERT into PRICE values("Sleeper", 700, 1540);
INSERT into PRICE values("Sleeper", 1000, 2200);
INSERT into PRICE values("Sleeper", 1200, 2640);
INSERT into PRICE values("Sleeper", 1500, 2700);
INSERT into PRICE values("Sitting", 500, 620);
INSERT into PRICE values("Sitting", 600, 744);
INSERT into PRICE values("Sitting", 700, 868);
INSERT into PRICE values("Sitting", 1000, 1240);
INSERT into PRICE values("Sitting", 1200, 1488);
INSERT into PRICE values("Sitting", 1500, 1860);

-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?

SELECT COUNT(CASE WHEN (Gender) = 'F' THEN 1 END) Female 
FROM passenger WHERE Distance >=600;

-- 4) Find the minimum ticket price for Sleeper Bus

SELECT MIN(price) FROM price WHERE Bus_Type = 'sleeper';

-- 5) Select passenger names whose names start with character 'S'

SELECT * FROM passenger WHERE Passenger_name LIKE 's%';

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output

SELECT Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price 
FROM passenger p1, price p2 
WHERE p1.Distance = p2.Distance 
and p1.Bus_type = p2.Bus_type;


-- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
-- for a distance of 1000 KM s

 SELECT p1.Passenger_name, p1.Boarding_city, p1.Destination_city, p1.Bus_type, p2.Price 
 FROM passenger p1, price p2 
 WHERE p1.Distance = 1000 
 and p1.Bus_type = 'Sitting' 
 and p1.Distance = 1000 
 and p1.Bus_type = 'Sitting';


-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
-- Panaji?

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city 
as Destination_city, p1.Destination_city 
as Boardng_city, p1.Bus_type, p2.Price 
FROM passenger p1, price p2 
WHERE Passenger_name = 'Pallavi' 
and p1.Distance = p2.Distance;


-- 9) List the distances from the "Passenger" table which are unique (non-repeated
-- distances) in descending order.

SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;

-- 10) Display the passenger name and percentage of distance travelled by that passenger
-- from the total distance travelled by all passengers without using user variables 

SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) 
FROM passenger)FROM passenger 
GROUP BY Distance;

-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000

SELECT Distance, Price FROM PRICE 
GROUP BY Distance HAVING Price>1000;

-- b) Average Cost if the cost is less than 1000 and greater than 500

SELECT Distance, Price FROM PRICE 
GROUP BY Distance HAVING Price<1000 and price>500;

-- c) Cheap otherwise

SELECT Distance, Price FROM PRICE 
GROUP BY Distance HAVING Price<500;