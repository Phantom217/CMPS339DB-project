CREATE TABLE PURCHASE_PRODUCT(
	
	purchase_id		int NOT NULL,
	product_id		int NOT NULL,
	num_items		int,
	total_price		money,
	CONSTRAINT PK_PURCHASE_PRODUCT PRIMARY KEY(purchase_id, product_id)
);