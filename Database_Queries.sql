--TEAM NAME: Quintinium
--TEAM MEMBERS' NAME: Dustin M. Branch, Benjamin Henry, Christopher Oalman
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--DDL QUERIES (THERE MUST BE 10 DDL QUERIES; GIVE A NUMBER "#" TO EACH QUERY)
--Q1: CREATE TABLE ...
-- Create a size table for products
CREATE TABLE SIZE(
	size_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	size_num		DECIMAL(11,2),
	size_char		VARCHAR(3) CHECK (size_char = 'XS' OR size_char = 'S' OR size_char = 'M' OR size_char = 'L' OR size_char = 'XL' OR size_char = 'XXL')
);

--Q2: ALTER TABLE ...
-- Add an attribute called size_index to PRODUCT table after removing the size attribute
ALTER TABLE PRODUCT
ADD size_index 			INT;

--Q3: CHECK QUERY:
-- Checks to make sure proper names are going into the c_name attribute
ALTER TABLE COURSE
ADD CONSTRAINT c_name CHECK (c_name = 'Introduction' OR c_name = 'Social Foundation' OR c_name = 'Bronze' OR c_name = 'Silver' OR c_name = 'Gold');



--Q4: ADD CONSTRAINT(S) TO THE TABLE ...
-- Add a constraint to the PRODUCT table to reference the SIZE table for sizes of indiviual products.
ALTER TABLE PRODUCT
ADD CONSTRAINT FK_PRODUCT_SIZE
FOREIGN KEY (size_index) REFERENCES SIZE(size_id);

--Q5: ADD TRIGGER TO CHECK ...
-- Create a trigger for altering and dropping tables
USE w0652777
GO
CREATE TRIGGER DDLTriggerToBlockTableDDL
ON DATABASE
FOR DROP_TABLE,ALTER_TABLE
AS
BEGIN
 PRINT 'Disable trigger DDLTriggerToBlockTableDDL to drop or alter tables'
 ROLLBACK
END
-- Trigger test
ALTER TABLE CUSTOMER
ADD messed_up BIT DEFAULT 1;



--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--DML QUERIES	(GIVE A NUMBER "#" TO EACH QUERY)

--Q1: TRIGGER TEST QUERY:
-- Create a trigger and test for course table
CREATE TRIGGER INSTEADOFTriggerCOURSE
ON COURSE
INSTEAD OF INSERT
AS
BEGIN
    PRINT('Instead of trigger is Executed!')
END;
-- Trigger test
INSERT INTO COURSE (c_name, c_description) VALUES ('Gold', 'testing');

--Q2: INSERT DATA:
-- Insert a new employee into the EMPLOYEE table.
INSERT INTO EMPLOYEE (e_id, fname, lname, e_email, e_address, e_city, e_state, phone_number, ssn, birth_date, job_title, d_num, mgmt_id) 
VALUES (57-1111054,'Newbie','Branch','newbieBranch@patch.com','2200 Morrison Blvd.','New Orleans','LA','985-750-8181','439-91-5617','1991-02-16','Telemarketor',5,4);

--Q3: UPDATE DATA:
-- Add 1 the each d_num column in the employee table, after using IDENTITY
-- We found that some values in our data was incremented strangly. This was a
-- Quick solution to the problem.
UPDATE EMPLOYEE
SET d_num = d_num + 1;



--Q4: DELETE DATA:
-- Delete an employee from EMPLOYEE table
DELETE FROM EMPLOYEE WHERE e_id = -1487710;



--Q5: QUERY DATA:
-- Determine how many appointments were made for the Social Foundation course.(course_id = 2)
SELECT *
FROM APPOINTMENT
WHERE course_id = 2;

--Q6: QUERY DATA WITH SUB-QUERY IN WHERE CLAUSE:
-- Find product that exists under the group name accessory
-- Example: https://www.essentialsql.com/get-reay-tdo-learn-sql-server-21-using-subqueries-in-the-where-clause/
SELECT P.p_id, P.p_name, P.retail_price, P.sum_in_stock
FROM PRODUCT AS P
WHERE EXISTS (SELECT P.p_group_name, P.sum_in_stock
			  FROM PRODUCT
			  WHERE P.p_group_name = 'accessories' AND P.sum_in_stock >= 1
			 );


--Q7: QUERY DATA WITH SUB-QUERY IN FROM CLAUSE:
-- Determine number of private lessons taken by student, ordered by date
SELECT sprvlt_id, tcprvt, scheduled_priv_date
FROM (SELECT sprvlt_id, scheduled_priv_date, tcprvt
      FROM STUD_PRIV_LESS_TAKEN
      GROUP BY sprvlt_id, sprvlr_id, scheduled_priv_date, tcprvt) AS privTakenSummary
ORDER BY scheduled_priv_date;


--Q8: QUERY DATA WITH SUB-QUERY IN SELECT CLAUSE:
-- Find total revenue per day from store
SELECT P.p_date, (SELECT SUM(total_price)
				FROM PURCHASE AS PUR
				WHERE PUR.p_id = P.p_id) AS AverageRevenue
FROM PURCHASE AS P;



--Q9: QUERY DATA WITH EXCEPT:
-- Select all names, job titles, and managemnt id in all departments except d_num 5 'Janitors'
-- Examples: https://www.tutorialspoint.com/sql/sql-except-clause.htm , https://www.techonthenet.com/sql_server/except.php
SELECT E.e_id, E.fname, E.lname, E.job_title, E.d_num, E.mgmt_id
FROM EMPLOYEE AS E
EXCEPT
SELECT E.e_id, E.fname, E.lname, E.job_title, E.d_num, E.mgmt_id
FROM EMPLOYEE AS E
WHERE E.job_title = 'Janitor';

--Q10: QUERY DATA WITH ANY/SOME/ALL:
-- Return rows in PRODUCT where total number of items in stock is greater than 10.
SELECT p_id, p_name, sum_in_stock
FROM PRODUCT
WHERE p_id = ANY (SELECT p_id FROM PRODUCT WHERE sum_in_stock > 10);


--Q11: INNER-JOIN-QUERY:
-- Determine which vendors supply each product. 
--Example: https://www.w3schools.com/sql/sql_join_inner.asp
SELECT P.p_id, P.p_name, V.v_id, V.v_name
FROM PRODUCT AS P
INNER JOIN  VENDOR AS V ON  P.vendor_id = V.v_id;

--Q12: FULL-OUTER-JOIN-QUERY:
-- See all lessons that were booked and then determine which lessons were taken that day.
-- Some useful links: https://stackoverflow.com/questions/2094793/when-is-a-good-situation-to-use-a-full-outer-join
-- https://www.w3schools.com/sql/sql_join_full.asp
SELECT B.appt_id, B.course_id, B.lesson_id, T.course_id, T.lesson_id
FROM LESSON_BOOKED AS B
FULL OUTER JOIN LESSON_TAKEN AS T ON B.appt_id = T.appt_id
ORDER BY B.appt_id;


--Q13#: LEFT-OUTER-JOIN-QUERY:
-- See all products bought for a particular purchase.
-- Example: https://www.w3schools.com/sql/sql_join_left.asp
SELECT *
FROM PURCHASE AS P
LEFT JOIN PURCHASE_PRODUCT AS PP ON P.p_id = PP.purchase_id
ORDER BY P.p_id;

--Q14: RIGHT-OUTER-JOIN-QUERY:
-- Get the first name, last name, and managment ID of employees that are teachers.
-- Link to where I found example: https://www.w3schools.com/sql/sql_join_right.asp
SELECT T.t_id, E.e_id, E.fname, E.lname, E.mgmt_id
FROM EMPLOYEE AS E
RIGHT JOIN TEACHER AS T ON E.e_id = T.employee_id
ORDER BY T.t_id;


--Q15 AGGREGATION-JOIN-QUERY WITH GROUP BY & HAVING:
-- Determine the total number of sales from each individual cashier
-- Links: https://www.w3schools.com/sql/sql_having.asp
-- https://www.w3schools.com/sql/sql_groupby.asp
SELECT E.e_id, E.lname, COUNT(P.sales_person) AS num_of_sales
FROM PRUCHASE AS P
INNER JOIN EMPLOYEE AS E ON P.sales_person = E.e_id
GROUP BY E.e_id
HAVING COUNT(P.sales_person) > 1;


--Q16: AGGREGATION-JOIN-QUERY WITH SUB-QUERY:
-- Determine number of employees in a particular department
SELECT D.d_num, COUNT(E.d_num) AS total_employees
FROM DEPARTMENT AS D
FULL OUTER JOIN EMPLOYEE AS E ON D.d_num = E.d_num
WHERE EXISTS (SELECT E.d_num
			  FROM EMPLOYEE
			  WHERE E.d_num >= 2
			)
GROUP BY D.d_num;

--Q17: WITH-QUERY:
-- Use a with query to shorten the employee table and see the department name that they work for.
WITH short_employee 
(e_id, lname, job_title, mgmt_id)
AS (SELECT e_id, lname, job_title, mgmt_id
	FROM EMPLOYEE)
SELECT *
FROM short_employee AS SE
FULL OUTER JOIN DEPARTMENT AS D ON SE.mgmt_id = D.mgmt_id

