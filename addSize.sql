CREATE TABLE SIZE(
	size_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	size_num		DECIMAL(2,1),
	size_char		VARCHAR(3) CHECK (size_char = 'XS' OR size_char = 'S' OR size_char = 'M' OR size_char = 'L' OR size_char = 'XL' OR size_char = 'XXL')
);



/* rename size in Product table and make it a foreign key for SIZE*/
ALTER TABLE PRODUCT
DROP COLUMN size;

ALTER TABLE PRODUCT
ADD size_index 			INT;

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_PRODUCT_SIZE
FOREIGN KEY (size_index) REFERENCES SIZE(size_id);



/* drop num_items and total_price from Purchase_Product and move them to Purchase */
ALTER TABLE PURCHASE_PRODUCT
DROP COLUMN num_items;

ALTER TABLE PURCHASE_PRODUCT
DROP COLUMN total_price;

ALTER TABLE PURCHASE
ADD num_items 	INT NOT NULL;


ALTER TABLE PURCHASE
ADD total_price 	MONEY NOT NULL;



/* add c_name to COURSE */
ALTER TABLE COURSE
ADD c_name 		VARCHAR(17) NOT NULL CHECK (c_name = 'Introduction' OR c_name = 'Social Foundation' OR c_name = 'Bronze' OR c_name = 'Silver' OR c_name = 'Gold');;

ALTER TABLE COURSE
ADD CONSTRAINT CHK_name 



/* add mgr_ssn to MANAGEMENT and remove it from DEPARTMENT */
ALTER TABLE DEPARTMENT
DROP COLUMN manager_ssn;

ALTER TABLE MANAGEMENT
ADD mgr_ssn		VARCHAR(11) NOT NULL DEFAULT 'XXX-XX-XXXX';



/* modify vendor to be correct */
ALTER TABLE VENDOR
ADD v_city	VARCHAR(20);

ALTER TABLE VENDOR
ADD v_state CHAR(2);
