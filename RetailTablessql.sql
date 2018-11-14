CREATE TABLE EMPLOYEE(
	e_id				INT NOT NULL PRIMARY KEY,
	first_name			VARCHAR(20) NOT NULL,
	last_name			VARCHAR(20) NOT NULL,
	e_address			VARCHAR(50),
	phone_number		CHAR(11),
	ssn					CHAR(9) NOT NULL DEFAULT 'XXXXXXXXX',
	birth_date			DATE NOT NULL,
	job_title			VARCHAR(20) NOT NULL,
	d_num				INT NOT NULL,
	s_ssn				CHAR(9) NOT NULL DEFAULT 'XXXXXXXXX'
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
	manager_ssn			VARCHAR(9) NOT NULL DEFAULT 'XXXXXXXXX', 
);
CREATE TABLE PRODUCT(
	p_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	p_name				VARCHAR(20) NOT NULL,
	p_group_name		VARCHAR(20) NOT NULL CHECK (p_group_name = 'shoes' OR p_group_name = 'costumes' OR p_group_name = 'accessories'),
	for_gender			VARCHAR(20) NOT NULL CHECK (for_gender = 'M' OR for_gender = 'F' OR for_gender = 'U'),
	size				VARCHAR(4),
	in_stock			BIT,
	sum_in_stock		INT,
	wholesale_price		MONEY NOT NULL,
	retail_price		MONEY NOT NULL,
	date_received		DATETIMEOFFSET DEFAULT GETDATE(), 
	quantity_received	INT,
	location_received	VARCHAR(50),
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
	ID					INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	d_num				INT NOT NULL,
	product_id			INT,

	CONSTRAINT FK_DEPT FOREIGN KEY (d_num) REFERENCES DEPARTMENT(d_num),	
	CONSTRAINT FK_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
								ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE PURCHASE(
	p_id 				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	customer_id 		INT NOT NULL,
	sales_person		INT NOT NULL,
	p_date				DATETIMEOFFSET NOT NULL DEFAULT GETDATE(),
	payment_method		VARCHAR(5) NOT NULL CHECK (payment_method = 'cash' OR payment_method = 'card' OR payment_method = 'check'),

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