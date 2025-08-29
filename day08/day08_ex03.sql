-- session 1 and 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
 
-- session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- session 1 and 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';