#QUESTION 1
SELECT Customer.cust_name AS "Customer",
Customer.grade AS "Grade",Orders.ord_no AS "Order No."
FROM Orders, Salesman, Customer
WHERE Orders.customer_id = Customer.custemor_id
AND orders.salesman_id = salesman.salesman_id
AND Salesman.city IS NOT NULL
AND Customer.grade IS NOT NULL;
#question 2
SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id FROM salesman
WHERE commision = (SELECT MAX(commision) FROM salesman));


#question 3

SELECT * FROM Orders
WHERE salesman_id =
    (SELECT salesman_id FROM Salesman 
     WHERE city='nagpur');
     
#question4

SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM Orders 
GROUP BY ord_date 
ORDER BY ord_date;

#question 5
SELECT *
FROM orders
WHERE purch_amt >
    (SELECT  AVG(purch_amt) FROM orders);
# question 7
#Entity SQL is a storage-independent query language that is similar to SQL.Entity SQL allows you to query entity data, 
#either as objects or in a tabular form.
#A relationship signifies an association among the entities.
# There are three types of relationships that can exist between the entities. 
#They are the binary, recursive and the ternary relationship.


#question 6

SELECT DISTINCT customer_id FROM Orders ORDER BY purch_amt DESC LIMIT 4,1;


#question 8

SELECT customer_id , bank_account_details.account_number, CASE WHEN ifnull(balance_amount,0) = 0 THEN Transaction_amount ELSE balance_amount END AS balance_amount
FROM bank_account_details INNER JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
AND account_type = "Credit Card";

#question 9

Select bank_account_details.account_number, balance_amount, transaction_amount
from bank_account_details inner join bank_account_transaction on bank_account_details.account_number = bank_account_transaction.account_number
And (date_format(Transaction_Date , '%Y-%m')  between "2020-03" and "2020-04");


#question 10

SELECT bank_account_details.customer_id, bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details LEFT JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
LEFT JOIN bank_customer ON bank_account_details.customer_id = bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );

