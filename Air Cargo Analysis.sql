-- COURSE END PROJECT 2 - AIR CARGO ANALYSIS

CREATE Database air_cargo;

USE air_cargo;

-- 1. Create an ER diagram for the given airlines database.
-- Done

-- 2. Write a query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, 
-- and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. 
-- Also, make sure that the distance miles field is greater than 0.

DROP TABLE route_details;
CREATE TABLE		route_details(
					id_route INT NOT NULL UNIQUE,
					num_flight INT CHECK (NOT NULL),
					orig_airport VARCHAR(50),
					dest_airport VARCHAR(50),
					id_aircraft VARCHAR(50) NOT NULL,
					distance_in_miles INT CHECK(distance_in_miles > 0)
);

CREATE TABLE route_details (
    route_id INT PRIMARY KEY,
    flight_num INT NOT NULL,  -- Fixed NOT NULL issue
    origin_airport VARCHAR(50),
    destination_airport VARCHAR(50),
    aircraft_id VARCHAR(50) NOT NULL,
    distance_miles INT CHECK (distance_miles > 0),  -- Works in MySQL 8.0+
    unique(route_id)
);

Desc route_details;
INSERT INTO ROUTES_DETAILS
VALUES 
			('1', '1111', 'EWR', 'HNL', '767-301ER', '4962'),
			('2', '1112', 'HNL', 'EWR', '767-301ER', '4962'),
			('3', '1113', 'EWR', 'LHR', 'A321', '3466'),
			('4', '1114', 'JFK', 'LAX', '767-301ER', '2475'),
			('5', '1115', 'LAX', 'JFK', '767-301ER', '2475'),
			('6', '1116', 'HNL', 'LAX', '767-301ER', '2556'),
			('7', '1117', 'LAX', 'ORD', 'A321', '1745'),
			('8', '1118', 'ORD', 'EWR', 'A321', '719'),
			('9', '1119', 'DEN', 'LAX', 'ERJ142', '862'),
			('10', '1120', 'HNL', 'DEN', 'A321', '3365'),
			('12', '1122', 'ABI', 'ADK', '767-301ER', '4300'),
			('13', '1123', 'ADK', 'BQN', 'A321', '2232'),
			('14', '1124', 'BQN', 'CAK', 'A321', '2445'),
			('15', '1125', 'CAK', 'ANI', '767-301ER', '2000'),
			('16', '1126', 'ALB', 'APN', 'A321', '1700'),
			('17', '1127', 'APN', 'BLV', '767-301ER', '1900'),
			('18', '1128', 'ANI', 'BGR', 'ERJ142', '2450'),
			('19', '1129', 'ATW', 'AVL', 'A321', '2222'),
			('20', '1130', 'AVL', 'BOI', '767-301ER', '3134'),
			('21', '1131', 'BFL', 'BET', 'A321', '2425'),
			('22', '1132', 'BGR', 'BJI', 'ERJ142', '1242'),
			('23', '1133', 'BLV', 'BFL', '767-301ER', '2354'),
			('24', '1134', 'BJI', 'BQN', 'A321', '1575'),
			('25', '1135', 'RDM', 'BJI', 'A321', '2425'),
			('26', '1136', 'BET', 'BTM', 'ERJ142', '1311'),
			('27', '1137', 'BOI', 'CLD', 'A321', '578'),
			('28', '1138', 'BOS', 'CDC', '767-301ER', '246'),
			('29', '1139', 'BKG', 'CRW', '767-301ER', '909'),
			('30', '1140', 'BUR', 'STT', 'CRJ900', '780'),
			('31', '1141', 'BTM', 'CHA', 'ERJ142', '660'),
			('32', '1142', 'CLD', 'CHI', '767-301ER', '246'),
			('33', '1143', 'CDC', 'CST', 'CRJ900', '1345'),
			('34', '1144', 'CRW', 'COD', 'A321', '2452'),
			('35', '1145', 'STT', 'CDB', 'ERJ142', '2121'),
			('36', '1146', 'CHA', 'COU', 'CRJ900', '1212'),
			('37', '1147', 'CHI', 'CST', '767-301ER', '999'),
			('38', '1148', 'CST', 'DAL', 'A321', '1111'),
			('39', '1149', 'COD', 'SCC', 'CRJ900', '1579'),
			('40', '1150', 'CDB', 'DEC', 'A321', '909'),
			('41', '1151', 'CAE', 'DRT', 'ERJ142', '898'),
			('42', '1152', 'CSG', 'BOS', '767-301ER', '890'),
			('43', '1153', 'CBM', 'BOI', 'A321', '8989'),
			('44', '1154', 'COU', 'CAK', '767-301ER', '7676'),
			('45', '1155', 'CCR', 'EWR', 'CRJ900', '676'),
			('46', '1156', 'CDV', 'HNL', '767-301ER', '8668'),
			('47', '1157', 'DAL', 'LAX', 'CRJ900', '675'),
			('48', '1158', 'SCC', 'DEN', 'A321', '5645'),
			('49', '1159', 'DEC', 'ABI', 'A321', '4533'),
			('50', '1160', 'DRT', 'ORD', 'A321', '2445');


-- 3. Write a query to display all the passengers (customers) who have travelled in routes 01 to 25. Take data  from the passengers_on_flights table.

SELECT		*
FROM		passengers_on_flights
WHERE		route_id BETWEEN 01 AND 25
ORDER BY 	route_id ASC;

-- 4. Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.
SELECT		count(*) AS bus_pass_num, sum(price_per_ticket) AS total_revenue
FROM		ticket_details
WHERE		class_id = 'Bussiness';

-- 5. Write a query to display the full name of the customer by extracting the first name and last name from the customer table.

SELECT		concat(first_name, ' ', last_name) AS full_name
FROM		customer;

-- 6. Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.

SELECT		distinct td.customer_id, c.first_name, c.last_name
FROM		customer c
INNER JOIN  ticket_details td
ON			c.customer_id = td.customer_id
ORDER BY 	td.customer_id;

-- 7. Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.

SELECT		DISTINCT td.customer_id, c.first_name, c.last_name, td.brand
FROM 		customer c INNER JOIn ticket_details td
On 			c.customer_id = td.customer_id
Having 		brand = 'Emirates';

-- 8. Write a query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.
SELECT  	customer_id, class_id
FROM		passengers_on_flights
GROUP BY 	class_id, customer_id
HAVING 		class_id = 'Economy Plus';


-- 9. Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.
SELECT 		sum(price_per_ticket) AS rev, IF(sum(price_per_ticket) > 10000, 'Crossed', 'Not Crossed') AS Rev_check
FROM 		ticket_details;

-- 10. Write a query to create and grant access to a new user to perform operations on a database.

CREATE USER	‘new_user'@'localhost’ identified BY ‘new_password’;

GRANT ALL PRIVILIGES ON air_cargo TO ‘new_user’ @’localhost’;

FLUSH PRIVILEGES;

SHOW GRANTS FOR ‘user1’ @’localhost’;

-- 11. Write a query to find the maximum ticket price for each class using window functions on the ticket_details table.
SELECT		DISTINCT class_id, max(price_per_ticket) OVER (partition by class_id) AS max_tkt_price
FROM		ticket_details;

-- 12. Write a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.

-- to check the current cost and speed
SELECT customer_id, route_id
FROM passengers_on_flights
WHERE route_id = 4;

-- to check the speed and performance after the index
CREATE index r_id
ON passengers_on_flights (route_id, customer_id);

SELECT customer_id, route_id
FROM passengers_on_flights
WHERE route_id = 4;


-- 13. For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.
EXPLAIN SELECT customer_id, route_id
FROM passengers_on_flights
WHERE route_id = 4;

-- 14. Write a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.

SELECT customer_id, sum(price_per_ticket) AS total_ticket_price
FROM ticket_details
GROUP BY customer_id WITH ROLLUP; 

-- 15. Write a query to create a view with only business class customers along with the brand of airlines.
CREATE VIEW bus_customers AS 
				SELECT t.customer_id, c.first_name,c.last_name, t.brand
				FROM ticket_details t INNER JOIN customer c
				ON t.customer_id = c.customer_id
				WHERE class_id = 'Bussiness';

SELECT *
FROM bus_customers;

-- 16. Write a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. 
-- Also, return an error message if the table doesn't exist.

SELECT *
FROM passengers_on_flights;

USE `air_cargo`;
DROP procedure IF EXISTS `get_passenger_details`;

DELIMITER //

CREATE PROCEDURE get_passenger_details(IN start_route VARCHAR(50), IN end_route VARCHAR(50))
BEGIN
    DECLARE table_exists INT;

    -- Check if the passenger_details table exists
    SELECT COUNT(*) INTO table_exists 
    FROM passengers_on_flights;

    -- If table does not exist, return an error message
    IF table_exists = 0 THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: table does not exist.';
    ELSE
        -- Retrieve passenger details for given route range
        SELECT customer_id, route_id, depart, arrival, seat_num
        FROM passengers_on_flights
        WHERE depart = start_route AND arrival = end_route;
    END IF;
END //

DELIMITER ;

CALL get_passenger_details('NYX', 'NDU');

-- 17. Write a query to create a stored procedure that extracts all the details from the routes table where the travelled distance is more than 2000 miles.

USE `air_cargo`;
DROP procedure IF EXISTS `dm`;

DELIMITER $$
USE `air_cargo`$$
CREATE PROCEDURE `dm` ()
BEGIN
SELECT *
FROM routes
WHERE distance_miles > 2000
ORDER BY route_id ASC;
END$$

DELIMITER ;

CALL dm();

-- 18. Write a query to create a stored procedure that groups the distance travelled by each flight into three categories. The categories are, 
--	short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.

USE `air_cargo`;
DROP procedure IF EXISTS `fc`;

DELIMITER $$
USE `air_cargo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fc`()
BEGIN
SELECT flight_num, distance_miles,
CASE
WHEN distance_miles > 6500 THEN 'long-distance travel (LDT)'
WHEN distance_miles > 2000 AND distance_miles <= 6500 THEN 'intermediate distance travel (IDT)'
ELSE 'short distance travel (SDT)'
END AS flight_categories
FROM routes;
END$$

DELIMITER ;

CALL 	fc();

-- 19. Write a query to extract ticket purchase date, customer ID, class ID and specify if the complimentary services are provided 
--	for the specific class using a stored function in stored procedure on the ticket_details table.
-- Condition: If the class is Business and Economy Plus, then complimentary services are given as Yes, else it is No


-- Creating a fn to check the complimentary service condition
USE `air_cargo`;
DROP function IF EXISTS `complimentary_service`;

-- Creating a function

DELIMITER $$
USE `air_cargo`$$
CREATE FUNCTION `complimentary_service` (class_id VARCHAR(100))
RETURNS VARCHAR(3)
READS SQL DATA
DETERMINISTIC
BEGIN 
RETURN if(class_id IN ('Bussiness', 'Economy Plus'), 'Yes', 'No');
END$$

DELIMITER ;

-- Creating a procedure with the function

USE `air_cargo`;
DROP procedure IF EXISTS `proc_compservices`;

DELIMITER $$
USE `air_cargo`$$
CREATE PROCEDURE `proc_compservices` ()
BEGIN
SELECT 		customer_id, Class_id, complimentary_service(class_id)
FROM		ticket_details
ORDER BY	customer_id ASC;
END$$

DELIMITER ;

CALL 		proc_compservices();

-- 20. Write a query to extract the first record of the customer whose last name ends with Scott using a cursor from the customer table.

USE `air_cargo`;
DROP procedure IF EXISTS `Proc_lnscott`;

DELIMITER $$
USE `air_cargo`$$
CREATE PROCEDURE `Proc_lnscott` ()
BEGIN DECLARE c_id int;
DECLARE 		f_name VARCHAR(100);
DECLARE 		l_name VARCHAR(100);
DECLARE 		dob date;
DECLARE 		sex VARCHAR(10);
DECLARE 		cursor_1 CURSOR FOR 
							SELECT		customer_id, first_name, last_name, date_of_birth, gender
							FROM 		customer
							WHERE 		last_name = 'Scott'
							Limit 		1;
OPEN 				cursor_1;
REPEAT FETCH 		cursor_1 INTO c_id,f_name,l_name, dob, sex;
UNTIL 				sex = 'M' OR sex = 'F' END REPEAT; 
SELECT 				c_id as customer_id, f_name as first_name, l_name as last_name, 
					dob as date_of_birth, sex as gender;

CLOSE 				cursor_1;
END$$

DELIMITER ;

Call Proc_lnscott();