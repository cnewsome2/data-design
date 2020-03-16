USE cnewsome2;
ALTER DATABASE cnewsome2 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer(
	customerId BINARY(16) NOT NULL,
	customerAddress VARCHAR(75) NOT NULL,
	customerEmail VARCHAR (50) NOT NULL,
	customerHash CHAR(100) NOT NULL,
	customerName VARCHAR (50) NOT NULL,
	customerPayment CHAR (16) NOT NULL,
	UNIQUE(customerEmail),
	PRIMARY KEY(customerId),
	KEY(customerAddress),
	INDEX(customerName, customerEmail)
);

CREATE TABLE products(
	productId BINARY(16) NOT NULL,
	productColor VARCHAR (32) NOT NULL,
	productDescription VARCHAR(180),
	productDetails VARCHAR(180),
	productName VARCHAR(60) NOT NULL,
	productSpecs VARCHAR(120),
	productCustomerId Binary (16) NOT NULL,
	productPrice DECIMAL (8) NOT NULL,
	FOREIGN KEY (productCustomerId) REFERENCES customer(customerId),
	PRIMARY KEY(productId)
);

CREATE TABLE orders(
	orderNumberId BINARY(16) NOT NULL,
	orderCustomerId BINARY(16),
	orderCustomerAddress VARCHAR(75) NOT NULL,
	orderCustomerName VARCHAR(50) NOT NULL,
	orderShippingDate DATETIME(6) NOT NULL,
	FOREIGN KEY(orderCustomerName) REFERENCES customer(customerName),
	FOREIGN KEY(orderCustomerId) REFERENCES customer(customerId),
	FOREIGN KEY(orderCustomerAddress) REFERENCES customer(customerAddress),
	PRIMARY KEY(orderNumberId)
);
