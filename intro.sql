-- DATABASE ACTIONS
DROP DATABASE IF EXISTS course_db;
CREATE DATABASE course_db;
ALTER DATABASE course_db RENAME TO courses;
DROP DATABASE course_db;


-- TABLE ACTIONS
CREATE TABLE users(
           user_id SERIAL NOT NULL,
           username VARCHAR ( 50 ) UNIQUE NOT NULL,
           email VARCHAR( 50 ) UNIQUE NOT NULL,
           age INTEGER,
           is_married BOOLEAN NOT NULL,
           user_image TEXT DEFAULT NULL,
           role TEXT NOT NULL,
           password VARCHAR ( 50 ) NOT NULL
);
ALTER TABLE users RENAME TO accounts;
DROP TABLE IF EXISTS users;
DROP TABLE users;

CREATE TABLE courses(
           course_id VARCHAR(50) UNIQUE NOT NULL,
           course_title VARCHAR ( 50 ) NOT NULL,
           course_price VARCHAR ( 50 ) NOT NULL,
           course_teacher VARCHAR ( 50 ) NOT NULL,
           course_description VARCHAR( 50 ) NOT NULL,
           user_id VARCHAR(50) NOT NULL
);
ALTER TABLE courses RENAME TO course;


-- TABLE COLUMNS ACTIONS
ALTER TABLE users ADD COLUMN role VARCHAR(30);
ALTER TABLE users RENAME COLUMN role TO roles;

\d+ users -> tabletsa tarkibidagi columnlarning type tekshirish.
ALTER TABLE accounds ALTER COLUMN users_test TYPE INTEGER USING (users_test::INTEGER)
ALTER TABLE accounds DROP COLUMN users_test;

ALTER TABLE accounds ALTER COLUMN users_test SET NOT NULL;
ALTER TABLE course ALTER COLUMN course_author DROP NOT NULL;


-- CRUD actions
-- create
INSERT INTO users(username, email, age, is_married, role, password)
      VALUES('user', 'user@gmail.com', 18, true, 'user', 'user123');

INSERT INTO users(username, email, age, is_married, role, password)
      VALUES('user1', 'user1@gmail.com', 18, true, 'user', 'user123');

INSERT INTO users(username, email, age, is_married, role, password)
      VALUES('user2', 'user2@gmail.com', 18, true, 'user', 'user123');

-- get list
SELECT * FROM users;

-- get one
SELECT * FROM users WHERE user_id = '3';

-- update
UPDATE users SET username = 'who', password = '123user', age = 65 WHERE user_id = '1';

-- delete
DELETE FROM users WHERE user_id = '3';

----------------------- COURSE ---------------------
-- CRUD actions
-- create
INSERT INTO course(course_id, course_title, course_price, course_teacher,
 course_description, user_id)
      VALUES('f3df2b69-0be3-49c1-b4d5-bec531d0852d', 
      'Vue', '800000', 'Vue teacher', 'Ilm Olish', '2'),
      ('d3df2b69-0be3-49c1-b4d5-bec531d0852d', 
      'Vue', '800000', 'Vue teacher', 'Ilm Olish', '2');

-- get list
SELECT * FROM course;

-- get one
SELECT * FROM course WHERE user_id = '2';

-- update
UPDATE course SET course_title = 'React'
 WHERE course_id = 'd3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM course WHERE course_id = 'd3df2b69-0be3-49c1-b4d5-bec531d0852d';


----------------------- CARS DATABASE ----------------------
CREATE DATABASE cars_db;

-- TABLE ACTIONS
CREATE TABLE users(
           user_id VARCHAR ( 50 ) UNIQUE NOT NULL,
           user_name VARCHAR ( 50 ) UNIQUE NOT NULL,
           user_surname VARCHAR ( 50 ) NOT NULL,
           user_email VARCHAR( 50 ) UNIQUE NOT NULL,
           user_age INTEGER,
           user_role TEXT NOT NULL,
           user_password VARCHAR ( 50 ) NOT NULL
);

-- CRUD actions
-- create
INSERT INTO users(user_id, user_name, user_surname,
      user_email, user_age, user_role, user_password)
      VALUES('f3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user1', 'userSurname', 'user1@gmail.com', 18, 'user', 'user123'),
      ('s3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user2', 'userSurname', 'user2@gmail.com', 18, 'user', 'user123'),
      ('d3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user3', 'userSurname', 'user3@gmail.com', 18, 'user', 'user123');

-- get list
SELECT * FROM users;

-- get one
SELECT * FROM users WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- update
UPDATE users SET user_name = 'who', user_password = '123user', user_age = 45
 WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM users WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- TABLE ACTIONS
CREATE TABLE cars(
           car_id VARCHAR ( 50 ) UNIQUE NOT NULL,
           car_title VARCHAR ( 50 ) NOT NULL,
           car_price VARCHAR ( 50 ) NOT NULL,
           cars_brand VARCHAR( 50 ) NOT NULL,
           car_color VARCHAR( 50 ) NOT NULL,
           created_by_user_id TEXT NOT NULL
);

-- CRUD actions
-- create
INSERT INTO cars(car_id, car_title, car_price, cars_brand, car_color, created_by_user_id)
      VALUES('23df2b69-0be3-49c1-b4d5-bec531d0852d',
      'cobalt', '35000$', 'GM', 'white', 'f3df2b69-0be3-49c1-b4d5-bec531d0852d');

-- get list
SELECT * FROM cars;

-- get one
SELECT * FROM cars WHERE car_id = '23df2b69-0be3-49c1-b4d5-bec531d0852d';

-- update
UPDATE cars SET car_price = '10000$' WHERE car_id = '23df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM cars WHERE car_id = '23df2b69-0be3-49c1-b4d5-bec531d0852d';


------------------- ANIMAL_DB DATABASE ----------------
CREATE DATABASE animal_db;

-- TABLE ACTIONS
CREATE TABLE users(
           user_id VARCHAR ( 50 ) UNIQUE NOT NULL,
           user_name VARCHAR ( 50 ) UNIQUE NOT NULL,
           user_surname VARCHAR ( 50 ) NOT NULL,
           user_email VARCHAR( 50 ) UNIQUE NOT NULL,
           user_age INTEGER,
           user_role TEXT NOT NULL,
           user_password VARCHAR ( 50 ) NOT NULL
);

-- CRUD actions
-- create
INSERT INTO users(user_id, user_name, user_surname,
      user_email, user_age, user_role, user_password)
      VALUES('f3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user1', 'userSurname', 'user1@gmail.com', 18, 'user', 'user123'),
      ('s3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user2', 'userSurname', 'user2@gmail.com', 18, 'user', 'user123'),
      ('d3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user3', 'userSurname', 'user3@gmail.com', 18, 'user', 'user123');

-- get list
SELECT * FROM users;

-- get one
SELECT * FROM users WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- update
UPDATE users SET user_name = 'who', user_password = '123user', user_age = 45
 WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM users WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- TABLE ACTIONS
CREATE TABLE animals(
           animal_id VARCHAR ( 50 ) UNIQUE NOT NULL,
           animal_title VARCHAR ( 50 ) NOT NULL,
           animal_type VARCHAR ( 50 ) NOT NULL,
           animal_color VARCHAR( 50 ) NOT NULL,
           created_by_user_id TEXT NOT NULL
);

-- CRUD actions
-- create
INSERT INTO animals(animal_id, animal_title, animal_type, animal_color, created_by_user_id)
      VALUES('43df2b69-0be3-49c1-b4d5-bec531d0852d',
      'rabbit', 'wild and not-wild', 'white-black', 'f3df2b69-0be3-49c1-b4d5-bec531d0852d');

-- get list
SELECT * FROM animals;

-- get one
SELECT * FROM animals WHERE animal_id = '43df2b69-0be3-49c1-b4d5-bec531d0852d';

-- update
UPDATE animals SET animal_title = 'some' WHERE animal_id = '43df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM animals WHERE animal_id = '43df2b69-0be3-49c1-b4d5-bec531d0852d';


------------------- FRUIT_DB DATABASE --------------------
CREATE DATABASE fruit_db;

-- TABLE ACTIONS
CREATE TABLE users(
           user_id VARCHAR ( 50 ) UNIQUE NOT NULL,
           user_name VARCHAR ( 50 ) UNIQUE NOT NULL,
           user_surname VARCHAR ( 50 ) NOT NULL,
           user_email VARCHAR( 50 ) UNIQUE NOT NULL,
           user_age INTEGER,
           user_role TEXT NOT NULL,
           user_password VARCHAR ( 50 ) NOT NULL
);

-- CRUD actions
-- create
INSERT INTO users(user_id, user_name, user_surname,
      user_email, user_age, user_role, user_password)
      VALUES('f3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user1', 'userSurname', 'user1@gmail.com', 18, 'user', 'user123'),
      ('s3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user2', 'userSurname', 'user2@gmail.com', 18, 'user', 'user123'),
      ('d3df2b69-0be3-49c1-b4d5-bec531d0852d',
      'user3', 'userSurname', 'user3@gmail.com', 18, 'user', 'user123');

-- get list
SELECT * FROM users;

-- get one
SELECT * FROM users WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- update
UPDATE users SET user_name = 'who', user_password = '123user', user_age = 45
 WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM users WHERE user_id = 's3df2b69-0be3-49c1-b4d5-bec531d0852d';

-- TABLE ACTIONS
CREATE TABLE fruits(
           fruit_id VARCHAR ( 50 ) UNIQUE NOT NULL,
           fruit_title VARCHAR ( 50 ) NOT NULL,
           fruit_type VARCHAR ( 50 ) NOT NULL,
           fruit_price VARCHAR( 50 ) NOT NULL,
           created_by_user_id TEXT NOT NULL
);

-- CRUD actions
-- create
INSERT INTO fruits(fruit_id, fruit_title, fruit_type, fruit_price, created_by_user_id)
      VALUES('43df2b69-0be3-49c1-b4d5-bec531d0852d',
      'apple', 'wild and not-wild', '10000', 'f3df2b69-0be3-49c1-b4d5-bec531d0852d'),
      ('53df2b69-0be3-49c1-b4d5-bec531d0852d',
      'apple', 'wild and not-wild', '10000', 'f3df2b69-0be3-49c1-b4d5-bec531d0852d');

-- get list
SELECT * FROM fruits;

-- get one
SELECT * FROM fruits WHERE fruit_id = '43df2b69-0be3-49c1-b4d5-bec531d0852d';

-- update
UPDATE fruits SET fruit_title = 'some' WHERE fruit_id = '43df2b69-0be3-49c1-b4d5-bec531d0852d';

-- delete
DELETE FROM fruits WHERE fruit_id = '43df2b69-0be3-49c1-b4d5-bec531d0852d';