psql postgres
CREATE DATABASE shop;
\q
psql shop;

CREATE TABLE country(
    id bigint PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    area VARCHAR(255) NOT NULL,
    population_of_country INT NOT NULL
);

create table customer (
    id bigint PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	patronymic VARCHAR(50),
	date_of_birth DATE,
	phone_number VARCHAR(50)
);

CREATE TABLE orders(
    id bigint PRIMARY KEY,
    amount INTEGER NOT NULL,
    common_price INTEGER NOT NULL
);

CREATE TABLE manufacturer(
    id bigint PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE product(
    id bigint PRIMARY KEY NOT NULL,  
    article integer NOT NULL,
    title VARCHAR(255) NOT NULL,
    price  NUMERIC NOT NULL
);

CREATE TABLE category(
    id bigint PRIMARY KEY,
    title VARCHAR(255)NOT NULL
 );

ALTER TABLE product ADD category_id BIGINT REFERENCES category(id);
ALTER TABLE product ADD manufacturer_id BIGINT REFERENCES manufacturer(id);
ALTER TABLE manufacturer ADD country_id BIGINT REFERENCES country(id);
ALTER TABLE orders ADD customer_id BIGINT REFERENCES customer(id);

INSERT INTO category(id, title) VALUES (1, 'Мебель');
INSERT INTO category(id, title) VALUES (2, 'Гаджеты');
INSERT INTO category(id, title) VALUES (3, 'Мужская одежда');
INSERT INTO category(id, title) VALUES (4, 'Toys');


INSERT INTO product(id, title, article, price) VALUES (1, 'Джинсы', '2456', '1650');
INSERT INTO product(id, title, article, price) VALUES (2, 'Шкаф', '3456', '54000');
INSERT INTO product(id, title, article, price) VALUES (3, 'Телефон', '3556', '25000');
INSERT INTO product(id, title, article, price) VALUES (4, 'Стол', '4729', '35000');

INSERT INTO manufacturer(id, title) VALUES (1, 'Samsung');
INSERT INTO manufacturer(id, title) VALUES (2, 'Prada');
INSERT INTO manufacturer(id, title) VALUES (3, 'Aristo');
INSERT INTO manufacturer(id, title) VALUES (4, 'Zamm');

INSERT INTO customer(id, first_name, last_name, email, patronymic, date_of_birth, phone_number) VALUES (1, 'Эркин', 'Бектуров', 'erkin@gmail.com','Чубакович', '1995-03-12', '0700343582');
INSERT INTO customer(id, first_name, last_name, email, patronymic, date_of_birth, phone_number) VALUES (2, 'Бакыт', 'Иманбеков', 'bakyt@gmail.com','Амантурович', '1920-01-01', '0555872961');
INSERT INTO customer(id, first_name, last_name, email, patronymic, date_of_birth, phone_number) VALUES (3, 'Самат', 'Ташболотов', 'samat@gmail.com','Эльдарович', '1975-04-09', '0772976311');
INSERT INTO customer(id, first_name, last_name, email, patronymic, date_of_birth, phone_number) VALUES (4, 'Сергей', 'Кочарев', 'sergei@gmail.com','Алексеевич', '1991-07-01', '0551546897');

INSERT INTO country(id, title, area, population_of_country) VALUES (1, 'Кыргызстан', '199 900 км²', 6457000);
INSERT INTO country(id, title, area, population_of_country) VALUES (4, 'Узбекистан','448 978 км²',3358000);
INSERT INTO country(id, title, area, population_of_country) VALUES (3, 'Таджикистан', '143 100 км²', 9321000);
INSERT INTO country(id, title, area, population_of_country) VALUES (2, 'Украина', '603 628 км²',  44390000);

INSERT INTO orders(id, amount, common_price) VALUES (1, 10, 73500);
INSERT INTO orders(id, amount, common_price) VALUES (2, 13, 98500);
INSERT INTO orders(id, amount, common_price) VALUES (3, 6, 56000);
INSERT INTO orders(id, amount, common_price) VALUES (4, 0, 0);

UPDATE product SET category_id = 1 WHERE id = 4;
UPDATE product SET category_id = 1 WHERE id = 2;
UPDATE product SET category_id = 3 WHERE id = 1;	
UPDATE product SET category_id = 2 WHERE id = 3;
UPDATE product SET category_id = 2 WHERE id = 1;

UPDATE product SET manufacturer_id = 2 WHERE id = 1;	
UPDATE product SET manufacturer_id = 1 WHERE id = 3;	
UPDATE product SET manufacturer_id = 3 WHERE id = 2;	
UPDATE product SET manufacturer_id = 4 WHERE id = 4;	
UPDATE product SET manufacturer_id = 4 WHERE id = 3;	

UPDATE manufacturer SET country_id = 2 WHERE id = 4;	
UPDATE manufacturer SET country_id = 1 WHERE id = 1;	
UPDATE manufacturer SET country_id = 3 WHERE id = 2;	
UPDATE manufacturer SET country_id = 4 WHERE id = 3;	
UPDATE manufacturer SET country_id = 4 WHERE id = 4;	
	
UPDATE orders SET customer_id = 2 WHERE id = 4;
UPDATE orders SET customer_id = 1 WHERE id = 1;	
UPDATE orders SET customer_id = 3 WHERE id = 2;	
UPDATE orders SET customer_id = 4 WHERE id = 3;
UPDATE orders SET customer_id = 4 WHERE id = 1;


SELECT * FROM product WHERE price > '100';

SELECT * FROM category WHERE title LIKE 'А%';

SELECT manufacturer_id, COUNT(*) FROM product GROUP BY 	manufacturer_id; 

SELECT COUNT(DISTINCT country_id) as amount_of_manufacturers FROM manufacturer GROUP BY country_id;
