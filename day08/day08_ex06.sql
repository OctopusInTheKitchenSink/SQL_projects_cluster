-- session 1 and 2 
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 1
SELECT SUM(rating) FROM pizzeria;

-- session 2
INSERT INTO pizzeria(id, name, rating)
VALUES(11, 'Kazan Pizza 2', 4);
COMMIT;

-- session 1
SELECT SUM(rating) FROM pizzeria;
-- выводится старая сумма, так как коммит был сделан в другой сессии (эта еще не обновлена)
COMMIT;

-- session 1 and 2
SELECT SUM(rating) FROM pizzeria;