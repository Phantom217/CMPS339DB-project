CREATE TABLE EMPLOYEE(
	e_id				INT NOT NULL PRIMARY KEY,
	fname				VARCHAR(20) NOT NULL,	-- renamed for consistency
	lname				VARCHAR(20) NOT NULL,	-- renamed for consistency
	e_email				VARCHAR(40),	-- added since this should be needed
	e_address			VARCHAR(50),
	e_city				VARCHAR(20),	-- added since data source doesn't provide in address
	e_state				CHAR(2),	-- added since data source doesn't provide in address
	phone_number			CHAR(12),	-- fixed this to fit generated data
	ssn				CHAR(11) NOT NULL DEFAULT 'XXX-XX-XXXX', -- +2 and added hyphens to fit generated data
	birth_date			DATE NOT NULL,
	job_title			VARCHAR(25) NOT NULL,	-- +5 just in case
	d_num				INT NOT NULL,
	s_ssn				CHAR(11) NOT NULL DEFAULT 'XXX-XX-XXXX'	-- +2 and added hyphens to fit generated data
);
CREATE TABLE CUSTOMER(
	c_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY
);
CREATE TABLE VENDOR(
	v_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	v_name				VARCHAR(20),
	v_location			VARCHAR(50)
);
CREATE TABLE DEPARTMENT(
	d_num				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	d_name				VARCHAR(20) NOT NULL,
	manager_ssn			VARCHAR(11) NOT NULL DEFAULT 'XXX-XX-XXXX', -- +2 and added hyphens to fit generated data
);
CREATE TABLE PRODUCT(
	p_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	p_name				VARCHAR(20) NOT NULL,
	p_group_name			VARCHAR(11) NOT NULL CHECK (p_group_name = 'shoes' OR p_group_name = 'costumes' OR p_group_name = 'accessories'), -- changed varchar(20) -> varchar(11) since that is the largest value that can be inserted there
	for_gender			CHAR(1) NOT NULL CHECK (for_gender = 'M' OR for_gender = 'F' OR for_gender = 'U'), -- changed varchar(20) -> to char(1) since only a single letter will be input
	size				VARCHAR(4),
	in_stock			BIT DEFAULT 0, -- added default to be false
	sum_in_stock			INT,
	wholesale_price			MONEY NOT NULL,
	retail_price			MONEY NOT NULL,
	date_received			DATETIMEOFFSET DEFAULT GETDATE(), 
	quantity_received		INT,
	location_received		VARCHAR(50),
	vendor_id			INT,

	CONSTRAINT FK_PRODUCT_VENDOR FOREIGN KEY (vendor_id) REFERENCES VENDOR(v_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE PRODUCT_COLOR(
	product_id			INT, 
	color				VARCHAR(20),

	CONSTRAINT FK_PRODUCT_COLOR FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE DEPT_PRODUCT(
	dp_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- renamed for consistency
	d_num				INT NOT NULL,
	product_id			INT,

	CONSTRAINT FK_DEPT FOREIGN KEY (d_num) REFERENCES DEPARTMENT(d_num),	
	CONSTRAINT FK_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE PURCHASE(
	p_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	customer_id 			INT NOT NULL,
	sales_person			INT NOT NULL,
	p_date				DATETIMEOFFSET NOT NULL DEFAULT GETDATE(),
	payment_method			VARCHAR(5) NOT NULL CHECK (payment_method = 'cash' OR payment_method = 'card' OR payment_method = 'check'),

	CONSTRAINT FK_PURCHASE_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMER(c_id),
	CONSTRAINT FK_PURCHASE_EMPLOYEE FOREIGN KEY (sales_person) REFERENCES EMPLOYEE(e_id) 
);
CREATE TABLE PURCHASE_PRODUCT(
	purchase_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	product_id			INT NOT NULL,
	num_items			INT NOT NULL,
	total_price			MONEY NOT NULL,

	CONSTRAINT FK_PURCHASE FOREIGN KEY (purchase_id) REFERENCES PURCHASE(p_id),
	CONSTRAINT FK_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
);
