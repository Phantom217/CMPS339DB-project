CREATE TABLE MANAGEMENT(
	mgmt_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20),
	lname				VARCHAR(20)
);
CREATE TABLE EMPLOYEE(
	e_id				INT NOT NULL PRIMARY KEY,
	fname				VARCHAR(20) NOT NULL,	-- renamed for consistency
	lname				VARCHAR(20) NOT NULL,	-- renamed for consistency
	e_email				VARCHAR(40),	-- added since this should be needed
	e_address			VARCHAR(50),
	e_city				VARCHAR(20),	-- added since data source doesn't provide in address
	e_state				CHAR(2),	-- added since data source doesn't provide in address
	phone_number		CHAR(12),	-- fixed this to fit generated data
	ssn					CHAR(11) NOT NULL DEFAULT 'XXX-XX-XXXX', -- +2 and added hyphens to fit generated data
	birth_date			DATE NOT NULL,
	job_title			VARCHAR(25) NOT NULL,	-- +5 just in case
	d_num				INT NOT NULL,
	mgmt_id				INT,       --CHAR(11) NOT NULL DEFAULT 'XXX-XX-XXXX'	-- +2 and added hyphens to fit generated data

	CONSTRAINT FK_EMPLOYEE_MANAGEMENT FOREIGN KEY (mgmt_id) REFERENCES MANAGEMENT(mgmt_id)
						ON DELETE SET NULL	ON UPDATE CASCADE
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
	mgmt_id				INT,

	CONSTRAINT FK_DEPARTMENT_MANAGEMENT FOREIGN KEY (mgmt_id) REFERENCES MANAGEMENT(mgmt_id)
						ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE PRODUCT(
	p_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	p_name				VARCHAR(20) NOT NULL,
	p_group_name		VARCHAR(11) NOT NULL CHECK (p_group_name = 'shoes' OR p_group_name = 'costumes' OR p_group_name = 'accessories'), -- changed varchar(20) -> varchar(11) since that is the largest value that can be inserted there
	for_gender			CHAR(1) NOT NULL CHECK (for_gender = 'M' OR for_gender = 'F' OR for_gender = 'U'), -- changed varchar(20) -> to char(1) since only a single letter will be input
	size				VARCHAR(4),
	in_stock			BIT DEFAULT 0, -- added default to be false
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

	CONSTRAINT FK_PC_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE DEPT_PRODUCT(
	dp_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- renamed for consistency
	d_num				INT NOT NULL,
	product_id			INT,

	CONSTRAINT FK_DP_DEPT FOREIGN KEY (d_num) REFERENCES DEPARTMENT(d_num),	
	CONSTRAINT FK_DP_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
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

	CONSTRAINT FK_PP_PURCHASE FOREIGN KEY (purchase_id) REFERENCES PURCHASE(p_id),
	CONSTRAINT FK_PP_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCT(p_id)
);
CREATE TABLE TEACHER(
	t_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	employee_id			INT,

	CONSTRAINT FK_TEACHER_EMPLOYEE FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(e_id)
					ON DELETE SET NULL		ON UPDATE CASCADE
);
CREATE TABLE SCHEDULE(
	s_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	teacher_id			INT,
	s_to				DATETIMEOFFSET NOT NULL,
	s_from				DATETIMEOFFSET NOT NULL,

	CONSTRAINT FK_SCHEDULE_TEACHER FOREIGN KEY (teacher_id) REFERENCES TEACHER(t_id)
);
CREATE TABLE STUDENT_DETAIL(
	sd_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20) NOT NULL,
	lname				VARCHAR(20) NOT NULL,
	sd_address			VARCHAR(50),
	sd_city				VARCHAR(20),	-- added to match employees
	sd_state			CHAR(2),	-- added to match employees
	email				VARCHAR(20),
	birth_date			DATE,
	phone_number			VARCHAR(10)
);
CREATE TABLE STUDENT(
	s_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20),
	lname				VARCHAR(20),
	stud_detail_id			INT,

	CONSTRAINT FK_STUDENT_DETAIL FOREIGN KEY (stud_detail_id) REFERENCES STUDENT_DETAIL(sd_id)
					ON DELETE SET NULL		ON UPDATE CASCADE
);
CREATE TABLE COURSE(
	c_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	c_name				VARCHAR(17) CHECK (c_name = 'Introduction' OR c_name = 'Social Foundation' OR c_name = 'Bronze' OR c_name = 'Silver' OR c_name = 'Gold'),
	c_description			VARCHAR(50)
);
CREATE TABLE LESSON(
	l_id				INT NOT NULL PRIMARY KEY,
	l_type				VARCHAR(5) NOT NULL CHECK (l_type = 'priv' OR l_type = 'group' OR l_type = 'pract'),
	duration			TIME,
	cost				MONEY,
	course_id			INT,

	CONSTRAINT FK_LESSON_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE ENROLLMENT(
	e_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	e_date				DATETIMEOFFSET DEFAULT GETDATE(),
	mgmt_id				INT,

	CONSTRAINT FK_ENROLL_MANAGEMENT FOREIGN KEY (mgmt_id) REFERENCES MANAGEMENT(mgmt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE ENROLLMENT_DETAIL(
	ed_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	enroll_id			INT,
	student_id			INT,
	course_id			INT,
	priv_course			INT NOT NULL,
	group_course			INT NOT NULL,
	pract_course			INT NOT NULL,
	supervisor_id			INT,
	teacher_id			INT,
	enroll_date			DATETIMEOFFSET DEFAULT GETDATE(),

	CONSTRAINT FK_ED_ENROLL FOREIGN KEY (enroll_id) REFERENCES ENROLLMENT(e_id)
					ON UPDATE CASCADE,
	CONSTRAINT FK_ED_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON UPDATE CASCADE,
	CONSTRAINT FK_ED_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id)
					ON UPDATE CASCADE,
	CONSTRAINT FK_ED_SUPERVISOR FOREIGN KEY (supervisor_id) REFERENCES MANAGEMENT(mgmt_id),
	CONSTRAINT FK_ED_TEACHER FOREIGN KEY (teacher_id) REFERENCES TEACHER(t_id)
);
CREATE TABLE STUDENT_PURCHASE_HIST(
	sph_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,	
	student_id			INT,
	enroll_detail_id		INT,
	sph_start_date			DATETIMEOFFSET DEFAULT GETDATE(), -- used instead of NOT NULL
	sph_end_date			DATETIMEOFFSET DEFAULT GETDATE(), -- used instead of NOT NULL

	CONSTRAINT FK_SPH_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SPH_ENROLL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id)
);
CREATE TABLE APPOINTMENT(
	appt_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	date_created			DATETIMEOFFSET DEFAULT GETDATE(),
	teacher_id			INT,
	student_id			INT,
	start_time			DATETIMEOFFSET DEFAULT GETDATE(), -- confirm this
	end_time			DATETIMEOFFSET DEFAULT GETDATE(), -- confirm this
	course_id			INT,
	lesson_id			INT,
	canceled			BIT DEFAULT 0,
	cancel_reason			TEXT,

	CONSTRAINT FK_APPT_TEACHER FOREIGN KEY (teacher_id) REFERENCES TEACHER(t_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_APPT_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_APPT_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id),
	CONSTRAINT FK_APPT_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
);
CREATE TABLE LESSON_TAKEN(
	lt_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	appt_id				INT,
	course_id			INT,
	lesson_id			INT,

	CONSTRAINT FK_LT_APPT FOREIGN KEY (appt_id) REFERENCES APPOINTMENT(appt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LT_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id),
	CONSTRAINT FK_LT_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
);
CREATE TABLE LESSON_DETAIL(
	ld_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	course_id			INT,
	lesson_id			INT,
	duration			TIME,

	CONSTRAINT FK_LD_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id),
	CONSTRAINT FK_LD_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
);
CREATE TABLE LESSON_BOOKED(
	lb_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	appt_id				INT,
	course_id			INT,
	lesson_id			INT,

	CONSTRAINT FK_LB_APPT FOREIGN KEY (appt_id) REFERENCES APPOINTMENT(appt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LB_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id),
	CONSTRAINT FK_LB_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
);
CREATE TABLE STUD_PRIV_LESS_TAKEN(
	sprvlt_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sprvlr_id			INT NOT NULL,
	scheduled_priv_date		DATETIMEOFFSET DEFAULT GETDATE(),
	lesson_taken_id			INT,
	tcprvt				INT,	-- total courses - private taken

	CONSTRAINT FK_SPRVLT_LESS_TAKEN FOREIGN KEY (lesson_taken_id) REFERENCES LESSON_TAKEN(lt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE STUD_PRIV_LESS_REMAIN(
	sprvlr_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sprvlt_id			INT NOT NULL,
	student_id			INT,
	enroll_detail_id		INT,
	tcprvr				INT,	-- total courses - private remain

	CONSTRAINT FK_SPRVLR_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SPRVLR_ENROLL_DETAIL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id),
	CONSTRAINT FK_SPRVLR_LESS_TAKEN FOREIGN KEY (sprvlt_id) REFERENCES LESSON_TAKEN(lt_id)
);
CREATE TABLE STUD_GROUP_LESS_TAKEN(
	sglt_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sglr_id				INT NOT NULL,
	scheduled_group_date		DATETIMEOFFSET DEFAULT GETDATE(),
	lesson_taken_id			INT,
	tcgt				INT,	-- total courses - group taken

	CONSTRAINT FK_SGLT_LESS_TAKEN FOREIGN KEY (lesson_taken_id) REFERENCES LESSON_TAKEN(lt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE STUD_GROUP_LESS_REMAIN(
	sglr_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	sglt_id				INT NOT NULL,
	student_id			INT,
	enroll_detail_id		INT,
	tcgr				INT,	-- total courses - group remain

	CONSTRAINT FK_SGLR_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SGLR_ENROLL_DETAIL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id),
	CONSTRAINT FK_SGLR_LESS_TAKEN FOREIGN KEY (sglt_id) REFERENCES LESSON_TAKEN(lt_id)
);
CREATE TABLE STUD_PRACT_LESS_TAKEN(
	spctlt_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	spctlr_id			INT NOT NULL,
	scheduled_pract_date		DATETIMEOFFSET DEFAULT GETDATE(),
	lesson_taken_id			INT,
	tcpctt				INT,	-- total courses - practice taken

	CONSTRAINT FK_SPCTLT_LESS_TAKEN FOREIGN KEY (lesson_taken_id) REFERENCES LESSON_TAKEN(lt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE STUD_PRACT_LESS_REMAIN(
	spctlr_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	spctlt_id			INT NOT NULL,
	student_id			INT,
	enroll_detail_id		INT,
	tcpctr				INT,	-- total courses - practice remain

	CONSTRAINT FK_SPCTLR_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SPCTLR_ENROLL_DETAIL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id),
	CONSTRAINT FK_SPCTLR_LESS_TAKEN FOREIGN KEY (spctlt_id) REFERENCES LESSON_TAKEN(lt_id)
);
