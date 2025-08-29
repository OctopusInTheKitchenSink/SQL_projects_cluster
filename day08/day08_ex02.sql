-- session 1 and 2 
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- это обновление теряется как только происходит коммит в первой сессии
-- ERROR: could not serialize access due to concurrent update

-- session 1
COMMIT; -- сохранение изменений для всех сессий

-- session 2
COMMIT;

-- session 1 and 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';