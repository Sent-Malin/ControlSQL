create table dbo.SKU
(
	ID int identity primary key,
	Code as concat('s',ID) unique,
	Name varchar(20)
);

create table dbo.Family
(
	ID int identity primary key,
	SurName varchar(20),
	BudgetValue money
);

create table dbo.Basket
(
	ID int identity,
	ID_SKU int,
	ID_Family int,
	Quantity int check(Quantity>-1),
	Value money check(Value>-1),
	PurchaseDate date default getdate(),
	DiscountValue money,
	foreign key (ID_SKU) references dbo.SKU (ID),
	foreign key (ID_Family) references dbo.Family (ID)
);

