CREATE TABLE PURCHASE(
	id 				int NOT NULL IDENTITY(1,1) PRIMARY KEY;
	customer_id 	int ,
	sales_person	int,
	p_date			DATETIMEOFFSET,
	payment_method	varchar(10),
);