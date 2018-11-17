CREATE TABLE TEACHER(
	t_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	employee_id			INT,

	CONSTRAINT FK_EMPLOYEE FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(e_id)
					ON DELETE SET NULL		ON UPDATE CASCADE
);
CREATE TABLE SCHEDULE(
	s_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	teacher_id			INT,
	s_to				DATETIMEOFFSET NOT NULL,
	s_from				DATETIMEOFFSET NOT NULL,

	CONSTRAINT FK_TEACHER FOREIGN KEY (teacher_id) REFERENCES TEACHER(t_id)
);
CREATE TABLE STUDENT_DETAIL(
	sd_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20) NOT NULL,
	lname				VARCHAR(20) NOT NULL,
	sd_address			VARCHAR(50),
	email				VARCHAR(20),
	birth_date			DATE,
	phone_number			VARCHAR(10)
);
CREATE TABLE STUDENT_PURCHASE_HIST(
	sph_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,	
	student_id			INT,
	enroll_detail_id		INT,
	sph_start_date			DATETIMEOFFSET NOT NULL, -- add DEFAULT GETDATE() instead?
	sph_end_date			DATETIMEOFFSET NOT NULL, -- add DEFAULT GETDATE() instead?

	CONSTRAINT FK_STUDENT FOREIGN KEY (student_id) REFERENCES STUDENT(s_id)
					ON DELETE SET NULL		ON UPDATE CASCADE,
	CONSTRAINT FK_ENROLLMENT FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(e_detail_id)
);
CREATE TABLE STUDENT(
	s_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20),
	lname				VARCHAR(20),
	stud_detail_id			INT,
	stud_purch_id			INT,	--added since it was in ER diagram and was missing

	CONSTRAINT FK_DETAIL FOREIGN KEY (stud_detail_id) REFERENCES STUDENT_DETAIL(sd_id)
					ON DELETE SET NULL		ON UPDATE CASCADE
);
-----------------------
-- Tyler's additions --
-----------------------
CREATE TABLE APPOINTMENT(
	appointment_id			INT NOT NULL PRIMARY KEY,
	date_created			DATETIMEOFFSET NOT NULL,
	teacher_id			INT,
	teacher_name			VARCHAR(20),		-- I don't think we need this key
	teacher_created			VARCHAR(20),
	student_id			INT,
	student_name			VARCHAR(20),		-- I don't think we need this key
	start_time			DATETIMEOFFSET,
	end_time			DATETIMEOFFSET,
	course_id			INT,
	lesson_type			VARCHAR() CHECK (lesson_type = "" OR lesson_type = "" OR lesson_type = ""),	-- fill in these fields with the correct data
	canceled			BOOLEAN,
	cancel_reason			TEXT			-- necessary?
);
CREATE TABLE LESSON_TAKEN(
	taken_id			INT NOT NULL PRIMARY KEY,
	appointment_id			INT,
	course_id			INT,
	lesson_type			VARCHAR() CHECK (lesson_type = "" OR lesson_type = "" OR lesson_type = "")	-- fill with data
);
CREATE TABLE LESSON_DETAIL(
	detail_id			INT NOT NULL PRIMARY KEY,
	course_id			INT,
	lesson_type			VARCHAR() CHECK (lesson_type = "" OR lesson_type = "" OR lesson_type = ""),	-- fill with data
	duration			TIME -- DATETIMEOFFSET?
);
CREATE TABLE LESSON_BOOKED(
	booked_id			INT NOT NULL PRIMARY KEY,
	appointment_id			INT,
	course_id			INT.
	lesson_type			VARCHAR() CHECK (lesson_type = "" OR lesson_type = "" OR lesson_type = "")	-- fill with data
);
CREATE TABLE MANAGEMENT(
	mgmt_id				INT NOT NULL PRIMARY KEY,
	fname				VARCHAR(20),
	lname				VARCHAR(20)
);
CREATE TABLE ENROLLMENT(
	enroll_id			INT NOT NULL PRIMARY KEY,
	enroll_date			DATETIMEOFFSET DEFAULT GETDATE(),
	mgmt_id				INT
);
CREATE TABLE ENROLLMENT_DETAIL(
	e_detail_id			INT NOT NULL PRIMARY KEY,
	enroll_id			INT,
	student_id			INT,
	course_id			INT,
	private_course			INT,
	group_course			INT,
	practice_course			INT,
	supervisor_id			INT,
	teacher_id			INT,
	enroll_date			DATETIMEOFFSET DEFAULT GETDATE()
);
CREATE TABLE COURSE(
	course_id			INT NOT NULL PRIMARY KEY,
	description			VARCHAR(50),		-- tweak varchar if needed
	dances				VARCHAR(50)		-- tweak as needed
);
CREATE TABLE LESSON(
	lesson_id			INT NOT NULL PRIMARY KEY,
	lesson_type			VARCHAR() CHECK (lesson_type = "" OR lesson_type = "" OR lesson_type = ""),	-- fill with data
	duration			TIME,
	cost				MONEY,
	course_id			INT
);
CREATE TABLE LESSON_TYPE_DETAIL(
	ltd_id				TYPE NOT NULL PRIMARY KEY,
	private_course			INT,
	group_course			INT,
	practice_course			INT
);
CREATE TABLE STUD_PRIV_LESS_REMAIN(
	splr_id				INT NOT NULL PRIMARY KEY,
	splt_id				INT NOT NULL,
	student_id			INT,
	enroll_detail_id		INT,
	tcpt_id				INT,
	tcpr_id				INT
);
CREATE TABLE STUD_PRIV_LESS_TAKEN(
	splt_id				INT NOT NULL PRIMARY KEY,
	splr_id				INT NOT NULL,
	scheduled_priv_date		DATETIMEOFFSET DEFAULT GETDATE(),	-- confirm this
	daily_priv_taken		INT,
	tcpt_id				INT
);
