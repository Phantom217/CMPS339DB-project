CREATE TABLE SIZE(
	size_id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	size_int		FLOAT(2,1),
	size_char		VARCHAR(3),
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
ADD COLUMN num_items 	INT NOT NULL;


ALTER TABLE PURCHASE
ADD COLUMN total_price 	MONEY NOT NULL;



/* add c_name to COURSE */
ALTER TABLE COURSE
ADD COLUMN c_name 		VARCHAR(17) NOT NULL;

ALTER TABLE COURSE
ADD CONSTRAINT c_name CHECK (c_name = 'Introduction' OR c_name = 'Social Foundation' OR c_name = 'Bronze' OR c_name = 'Silver' OR c_name = 'Gold');
