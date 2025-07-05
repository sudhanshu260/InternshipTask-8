create database custord;

use custord;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES
(1, 'Sudhanshu', 'Delhi'),
(2, 'subham', 'Mumbai'),
(3, 'Himanshu', 'Chennai'),
(4, 'Ayoosh', 'Kolkata');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 60000),
(102, 2, 'Phone', 25000),
(103, 1, 'Mouse', 1200),
(104, 3, 'Keyboard', 2000),
(105, 5, 'Monitor', 15000);


INSERT INTO Customers VALUES
(5, 'Shital', 'Pune'),
(6, 'Deepu', 'Bangalore');
  
  
DELIMITER //

CREATE PROCEDURE GetCustomerOrders (IN cust_id INT)
BEGIN
    SELECT o.order_id, o.product, o.amount
    FROM Orders o
    WHERE o.customer_id = cust_id;
END //

DELIMITER ;

CALL GetCustomerOrders(1);


DELIMITER //

CREATE FUNCTION TotalSpentByCustomer(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT IFNULL(SUM(amount), 0) INTO total
    FROM Orders
    WHERE customer_id = cust_id;

    RETURN total;
END //

DELIMITER ;

SELECT TotalSpentByCustomer(1) AS TotalSpent;