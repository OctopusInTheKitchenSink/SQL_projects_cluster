-- session 1 and 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- session 1
SELECT SUM(rating) FROM pizzeria;

-- session 2
INSERT INTO pizzeria(id, name, rating)
VALUES (10, 'Kazan Pizza', 5);
COMMIT;

-- session 1
SELECT SUM(rating) FROM pizzeria;
-- сразу выводится обновленная сумма
COMMIT;

-- session 1 and 2
SELECT SUM(rating) FROM pizzeria;
