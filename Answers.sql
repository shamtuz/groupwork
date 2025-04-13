-- Create the book table
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- Create the author table
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    biography TEXT
);

-- Create the book_author table to manage the many-to-many relationship
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Create the book_language table
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100) NOT NULL
);

-- Create the publisher table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

-- Create the address_status table
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

-- Create the address table
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    country_id INT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Create the country table
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

-- Create the cust_order table
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Create the order_line table
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Create the shipping_method table
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100) NOT NULL
);

-- Create the order_history table
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

-- Create the order_status table
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

--Q2
book

book_id: INT (Primary Key, Auto Increment)
title: VARCHAR(255) (Not Null)
publication_year: INT
language_id: INT (Foreign Key)
publisher_id: INT (Foreign Key)
author

author_id: INT (Primary Key, Auto Increment)
name: VARCHAR(255) (Not Null)
biography: TEXT
book_author

book_id: INT (Foreign Key)
author_id: INT (Foreign Key)
(Primary Key: book_id, author_id)
book_language

language_id: INT (Primary Key, Auto Increment)
language_name: VARCHAR(100) (Not Null)
publisher

publisher_id: INT (Primary Key, Auto Increment)
name: VARCHAR(255) (Not Null)
address: VARCHAR(255)
customer

customer_id: INT (Primary Key, Auto Increment)
first_name: VARCHAR(100) (Not Null)
last_name: VARCHAR(100) (Not Null)
email: VARCHAR(255) (Unique, Not Null)
phone: VARCHAR(20)
address_status

status_id: INT (Primary Key, Auto Increment)
status_name: VARCHAR(50) (Not Null)
address

address_id: INT (Primary Key, Auto Increment)
customer_id: INT (Foreign Key)
country_id: INT (Foreign Key)
street: VARCHAR(255) (Not Null)
city: VARCHAR(100) (Not Null)
postal_code: VARCHAR(20)
status_id: INT (Foreign Key)
country

country_id: INT (Primary Key, Auto Increment)
country_name: VARCHAR(100) (Not Null)
cust_order

order_id: INT (Primary Key, Auto Increment)
customer_id: INT (Foreign Key)
order_date: DATETIME (Default: Current Timestamp)
shipping_method_id: INT (Foreign Key)
order_status_id: INT (Foreign Key)
order_line

order_line_id: INT (Primary Key, Auto Increment)
order_id: INT (Foreign Key)
book_id: INT (Foreign Key)
quantity: INT (Not Null)
shipping_method

shipping_method_id: INT (Primary Key, Auto Increment)
method_name: VARCHAR(100) (Not Null)
order_history

history_id: INT (Primary Key, Auto Increment)
order_id: INT (Foreign Key)
status_id: INT (Foreign Key)
change_date: DATETIME (Default: Current Timestamp)
order_status

order_status_id: INT (Primary Key, Auto Increment)
status_name: VARCHAR(50) (Not Null)


--Q3
-- Create the book table
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- Create the author table
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    biography TEXT
);

-- Create the book_author table to manage the many-to-many relationship
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Create the book_language table
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100) NOT NULL
);

-- Create the publisher table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100 

    --Q4
    -- Create roles
CREATE ROLE 'admin';
CREATE ROLE 'staff';
CREATE ROLE 'customer';

-- Create users
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'staff_user'@'localhost' IDENTIFIED BY 'staff_password';
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'customer_password';

-- Assign roles to users
GRANT 'admin' TO 'admin_user'@'localhost';
GRANT 'staff' TO 'staff_user'@'localhost';
GRANT 'customer' TO 'customer_user'@'localhost';


-- Grant permissions to admin role
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'admin';

-- Grant permissions to staff role
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO 'staff';

-- Grant permissions to customer role
GRANT SELECT ON bookstore_db.book, bookstore_db.publisher, bookstore_db.cust_order TO 'customer';


-- Set default roles for users
SET DEFAULT ROLE 'admin' TO 'admin_user'@'localhost';
SET DEFAULT ROLE 'staff' TO 'staff_user'@'localhost';
SET DEFAULT ROLE 'customer' TO 'customer_user'@'localhost';


--Q5
SELECT * FROM book;

SELECT a.name AS author_name, b.title AS book_title
FROM author a
JOIN book_author ba ON a.author_id = ba.author_id
JOIN book b ON ba.book_id = b.book_id;

SELECT c.first_name, c.last_name, o.order_id, o.order_date
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id;

SELECT bl.language_name, COUNT(b.book_id) AS book_count
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
GROUP BY bl.language_name;

SELECT oh.change_date, os.status_name
FROM order_history oh
JOIN order_status os ON oh.status_id = os.order_status_id
WHERE oh.order_id = 1;  -- Replace 1 with the desired order ID

SELECT a.street, a.city, a.postal_code, as.status_name
FROM address a
JOIN address_status as ON a.status_id = as.status_id
WHERE a.customer_id = 1;  -- Replace 1 with the desired customer ID

SELECT b.title, SUM(ol.quantity) AS total_sales
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
JOIN cust_order o ON ol.order_id = o.order_id
WHERE o.order_status_id = (SELECT order_status_id FROM order_status WHERE status_name = 'delivered')
GROUP BY b.title;


