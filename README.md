# InternshipTask-8
Task 8: Stored Procedures and Functions

Objective
Create reusable SQL blocks using stored procedures and functions.

 Tables Used
- Customers
- Orders

Tasks Done

1. Stored Procedure: `GetCustomerOrders`**
   - Input: `cust_id` (INT)
   - Output: List of orders for that customer

2. Function: `TotalSpentByCustomer`**
   - Input: `cust_id` (INT)
   - Output: Total amount spent by the customer
 Usage
```sql
CALL GetCustomerOrders(1);
SELECT TotalSpentByCustomer(1);
