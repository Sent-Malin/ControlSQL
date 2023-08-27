CREATE TABLE dbo.SKU
(
	ID INT identity primary key,
	Code AS CONCAT('s',ID) unique,
	Name VARCHAR(20)
);

CREATE TABLE dbo.Family
(
	ID INT identity primary key,
	SurName VARCHAR(20),
	BudgetValue MONEY
);

CREATE TABLE dbo.Basket
(
	ID INT identity,
	ID_SKU INT,
	ID_Family INT,
	Quantity INT CHECK(Quantity>-1),
	Value MONEY CHECK(Value>-1),
	PurchaseDate DATE DEFAULT GETDATE(),
	DiscountValue MONEY,
	FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU (ID),
	FOREIGN KEY (ID_Family) REFERENCES dbo.Family (ID)
);

