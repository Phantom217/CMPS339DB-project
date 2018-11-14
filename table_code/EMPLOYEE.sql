CREATE TABLE EMPLOYEE(
	employee_id		INT NOT NULL PRIMARY KEY,
	first_name		VARCHAR(20),
	last_name		VARCHAR(20),
	address			VARCHAR(50),
	phone_number	CHAR(11),
	ssn				CHAR(9),
	birth_date		DATE,
	job_title		VARCHAR(20),
	d_num			int,
	s_ssn			CHAR(9)
);