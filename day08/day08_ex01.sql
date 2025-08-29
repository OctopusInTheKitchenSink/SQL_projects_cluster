-- session 1 and 2
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- после этого и до коммита первой сессии терминал "ждал", не принимая команды

-- session 1
COMMIT;

-- session 2
COMMIT;

-- session 1 and 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';