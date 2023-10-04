--  Mustaqil o`rganish
--  GROUPING SETS
--  CUBE
--  ROLLUP
--  ANY
--  ALL


1.
-- users table -> age > 20 && age < 30 bo`lgan users larning sonini va user_email 
-- ni chiqaring.
SELECT count(*), email FROM users WHERE age BETWEEN 20 AND 30 GROUP BY email; // ??

2.  // success
-- users table -> age > 0 && age < 40 bo`lgan userlarning age yig`indisini, 
-- min va max, count qiymatlarni chiqaring.
SELECT sum(age), min(age), max(age), count(age) FROM users WHERE age BETWEEN 0 AND 40;

3.  // success
-- users -> id -> shart(age > 30) -> result => id user_name user_email ni chiqaring.
SELECT user_id, username, email FROM users WHERE user_id IN(
    SELECT user_id FROM users WHERE username IN(
         SELECT username FROM users WHERE age > 30
    )
);

4.  // success
-- users -> shart(age > 30 && age < 40) username 'A(a)%' bo`lganlarni qaytarsin.
SELECT * FROM users WHERE age BETWEEN 30 AND 40 AND username IN(
    SELECT username FROM users WHERE username LIKE 'user%'
);

5.
-- courses -> teacher_id => course_title === ('React', 'Angular', 'VueJs') =>
-- course_id, course_title, teacher_name, user_name

6.
-- courses -> teacher_id => ushbu teacherga tegishli 2 ta courseni chiqaring.



    