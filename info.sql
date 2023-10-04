-- POSTGRESQL FUNDAMENTALS 
        -- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select/

-- PostgreSQL Aggregate Functions
        -- https://www.postgresqltutorial.com/postgresql-aggregate-functions/



------------- POSTGRESQL FUNDAMENTALS ----------------

-- AS
-- biron-bir column yoki table va-yoki biron narsaga taxallus berishda ishlatiladi.
SELECT user_id AS id FROM users; 

SELECT column_name AS alias_name FROM table_name;

SELECT column_name alias_name FROM table_name;


-- ORDER BY
-- ASC ketma-ket tartib alfabit va raqam bo`yicha tartiblab beradi,
-- DESC esa teskari xolatda tartiblab beradi.
SELECT user_id id FROM users ORDER BY id DESC;


-- DISTINCT
-- select qilingan table dagi ma`lumotlarni 
-- bir xil qiymatlarni olib tashlab bittasini qoldirib beradi.
SELECT DISTINCT username FROM users;


-- LIMIT
-- berilgan qiymat bo`yicha shunchasini tanlab olib beradi, chegara qo`yadi.
SELECT * FROM users LIMIT 10;


-- OFFSET
-- berilgan qiymatni tashlab ketadi.
SELECT * FROM users LIMIT 10 OFFSET 5;


-- FETCH FIRST 5 ROW ONLY
-- berilgan qiymat bo`yicha shunchasini tanlab olib beradi, chegara qo`yadi.
SELECT * FROM users FETCH FIRST 5 ROW ONLY;
SELECT * FROM users FETCH FIRST 5 ROW ONLY OFFSET 10;


-- IN
-- IN(ni ichida berilgan qiymat bo`yicha tanlab olib beradi.)
SELECT * FROM users WHERE user_id IN(5, 6, 7, 8, 9, 10);
SELECT * FROM users WHERE user_id IN(5, 13, 7, 8, 55, 10);


-- BETWEEN a and b
-- berilgan a va b qiymatlar bo`yicha tanlab olib beradi.
SELECT * FROM users WHERE user_id BETWEEN 5 AND 10;


-- LIKE
-- berilagan qiymat bo`yicha o`xshashlarini tanlab olib beradi qolgani % => farqi yo`q.
SELECT * FROM users WHERE username LIKE 'user1%';
SELECT * FROM users WHERE username LIKE '%1';
SELECT * FROM users WHERE username LIKE '%1%';
SELECT * FROM users WHERE username LIKE '%r%';


-- ILIKE 
-- berilagan qiymat bo`yicha o`xshashlarini tanlab olib beradi qolgani % => farqi yo`q.
-- berilgan qiymat katta harfmi yoki kichkina bo`lsa ham.
SELECT * FROM users WHERE username ILIKE '%R%';


-- GROUP BY
-- berilgan qiymat bo`yicha tanlab olib guruhlab sonini qaytarib beradi,
-- va bir xil qiymatlarini guruhlab qaytaradi. 
SELECT count(username), username FROM users GROUP BY username;


-- UNION
-- 1 - table bilan 2 - table ning ustunlari bir xil bo`lsa va uning o`zgaruvchi 
-- type lari ham bir xil bo`ladigan bo`lsa tagma-tag (bitta table da) qaytaradi.
CREATE TABLE t1(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO t1(title,release_year) 
VALUES ('The Shawshank Redemption',1994),
        ('The Godfather',1972),
        ('12 Angry Men',1957);

CREATE TABLE t2(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO t2(title,release_year)
VALUES ('An American Pickle',2020),
        ('The Godfather',1972),
        ('Greyhound',2020);

SELECT * FROM t1 UNION SELECT * FROM t2;


-- INTERSECT
-- 2 ta table ning ustunlari bir xil bo`lsa va uning o`zgaruvchi 
-- type lari ham bir xil bo`ladigan bo`lsa bir xil qiymatlarni qaytaradi.
SELECT * FROM t1 INTERSECT SELECT * FROM t2;


-- HAVING
-- GROUP BY dan keyin ishlatiladi, WHERE bilan bir xil.
SELECT count(username), username FROM users GROUP BY username HAVING count(username) > 2;


-- SUBQUERY
-- query ostidagi (ichidagi) query hisoblanadi.
SELECT * FROM users WHERE user_id IN(
    SELECT user_id FROM users WHERE username LIKE 'user1%'
);

SELECT * FROM users WHERE user_id IN(
    SELECT user_id FROM users WHERE username IN(
        SELECT username FROM users WHERE age BETWEEN 10 AND 20
    )
);


-- EXISTS       (TRUE yoki FALSE)
-- true yoki false qaytaradi, agar true bo`lsa EXISTS dan oldingi qism ishlab ketadi,
-- false bo`lsa ishalamaydi.
SELECT * FROM users WHERE EXISTS (
    SELECT * FROM users WHERE user_id = 21
);

select * from users where true;


-- SEQUENCE
-- har safar oshib boruvchi Function.
CREATE SEQUENCE test1
INCREMENT 5
START 1;

SELECT nextval('test1');


-- CHECK
-- shartga ko`ra tekshiradi.



-------------- Aggregate Functions ----------------
count() sonini qaytaradi.
max(),  eng baland qiymatni qaytaradi.
min(),  eng past qiymatni qaytaradi.
sum(),  yigindini qaytaradi.
avg(),  ortacha qiymatni qaytaradi.

select 
    count(user_id),
    max(age),
    min(age),
    sum(age),
    avg(age),
    ARRAY_AGG (
        username || ' ' || email
        order by
         username
    ) user_info
  from users where age = 45;
