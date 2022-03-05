CREATE DATABASE product_app;
USE product_app;

SELECT DATABASE();

DROP TABLE customers;
CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

DROP TABLE orders;
CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    ON DELETE CASCADE
);


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 33.67, 1);

-- 2번 거쳐서 주문건 찾기
SELECT * FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id=1;

-- 서브쿼리를 이용한 주문 건 찾기
SELECT * FROM orders WHERE customer_id=
	(
		SELECT id FROM customers
        WHERE last_name='George'
    );

-- cross join
SELECT * FROM customers, orders;
-- implicit inner join
SELECT * FROM customers, orders WHERE customers.id=orders.customer_id;
-- explicit inner join
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id=orders.customer_id;
-- 그룹 바이를 사용하는경우 select할 수 있는 컬럼은 그룹바이에 나열되어있는 컬럼과 집계함수 sum, count 등 만 가능하다 
SELECT 
c.first_name, 
c.last_name, 
o.order_date, 
SUM(o.amount) AS total_spent
FROM customers AS c JOIN orders AS o ON c.id=o.customer_id
GROUP BY first_name, last_name, order_date;

-- left join
SELECT 
 first_name,
 last_name,
 IFNULL(SUM(amount), 0) AS total_spent
 FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id
    GROUP BY first_name, last_name
    ORDER BY total_spent DESC;
    
-- right join
SELECT 
 first_name,
 last_name,
 IFNULL(SUM(amount), 0) AS total_spent
 FROM customers
RIGHT JOIN orders
	ON customers.id = orders.customer_id
    GROUP BY first_name, last_name
    ORDER BY total_spent DESC;


DELETE FROM customers WHERE id=1;
SELECT * FROM customers;


-- one to many exercise
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
 
 
CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- practice 1
SELECT first_name, title, grade FROM students JOIN papers ON students.id=papers.student_id ORDER BY grade DESC;
-- practice 2
SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id=papers.student_id;
-- practice 3
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) FROM students LEFT JOIN papers ON students.id=papers.student_id;
-- practice 4
SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM students LEFT JOIN papers ON students.id=papers.student_id GROUP BY first_name ORDER BY average DESC;
-- practice 5
SELECT first_name, 
       Ifnull(Avg(grade), 0) AS average, 
       CASE 
         WHEN Avg(grade) IS NULL THEN 'FAILING' 
         WHEN Avg(grade) >= 75 THEN 'PASSING' 
         ELSE 'FAILING' 
       end                   AS passing_status 
FROM   students 
       LEFT JOIN papers 
              ON students.id = papers.student_id 
GROUP  BY students.id 
ORDER  BY average DESC;
