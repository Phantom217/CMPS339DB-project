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
	email				VARCHAR(20),
	birth_date			DATE,
	phone_number			VARCHAR(10)
);
CREATE TABLE STUDENT(
	s_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20),
	lname				VARCHAR(20),
	stud_detail_id			INT,
	stud_purch_id			INT,	--added since it was in ER diagram and was missing

	CONSTRAINT FK_STUDENT_DETAIL FOREIGN KEY (stud_detail_id) REFERENCES STUDENT_DETAIL(sd_id)
					ON DELETE SET NULL		ON UPDATE CASCADE
);
CREATE TABLE COURSE(
	c_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
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
CREATE TABLE MANAGEMENT(
	mgmt_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fname				VARCHAR(20),
	lname				VARCHAR(20)
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
	CONSTRAINT FK_ED_SUPERVISOR FOREIGN KEY (supervisor_id) REFERENCES MANAGEMENT(mgmt_id)
					ON UPDATE CASCADE,
	CONSTRAINT FK_ED_TEACHER FOREIGN KEY (teacher_id) REFERENCES TEACHER(t_id)
					ON UPDATE CASCADE	
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
	CONSTRAINT FK_APPT_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_APPT_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE LESSON_TAKEN(
	lt_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	appt_id				INT,
	course_id			INT,
	lesson_id			INT,

	CONSTRAINT FK_LT_APPT FOREIGN KEY (appt_id) REFERENCES APPOINTMENT(appt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LT_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LT_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE LESSON_DETAIL(
	ld_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	course_id			INT,
	lesson_id			INT,
	duration			TIME,

	CONSTRAINT FK_LD_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LD_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE LESSON_BOOKED(
	lb_id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	appt_id				INT,
	course_id			INT,
	lesson_id			INT,

	CONSTRAINT FK_LB_APPT FOREIGN KEY (appt_id) REFERENCES APPOINTMENT(appt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LB_COURSE FOREIGN KEY (course_id) REFERENCES COURSE(c_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_LB_LESSON FOREIGN KEY (lesson_id) REFERENCES LESSON(l_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
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
	CONSTRAINT FK_SPRVLR_ENROLL_DETAIL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SPRVLR_LESS_TAKEN FOREIGN KEY (splt_id) REFERENCES LESSON_TAKEN(lt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
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
	CONSTRAINT FK_SGLR_ENROLL_DETAIL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SGLR_LESS_TAKEN FOREIGN KEY (splt_id) REFERENCES LESSON_TAKEN(lt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
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
	CONSTRAINT FK_SPCTLR_ENROLL_DETAIL FOREIGN KEY (enroll_detail_id) REFERENCES ENROLLMENT_DETAIL(ed_id)
					ON DELETE SET NULL	ON UPDATE CASCADE,
	CONSTRAINT FK_SPCTLR_LESS_TAKEN FOREIGN KEY (splt_id) REFERENCES LESSON_TAKEN(lt_id)
					ON DELETE SET NULL	ON UPDATE CASCADE
);
