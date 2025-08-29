-- session 1 and 2
BEGIN;

-- session 1
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;

-- session 2
UPDATE pizzeria SET rating = 1.0 WHERE id = 2;

-- session 1
UPDATE pizzeria SET rating = 4.3 WHERE id = 2;

-- session 2
UPDATE pizzeria SET rating = 3.0 WHERE id = 1;
-- две транзакции ждут друг друга, и ни одна из них не может продвинуться
-- чтобы решить эту проблему постгрес отменяет вторую транзакцию

-- session 1
COMMIT;

-- session 2 
COMMIT;

/*UPDATE pizzeria SET rating = 4.6 WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.0 WHERE id = 1;
UPDATE pizzeria SET rating = 4.3 WHERE id = 2;
DELETE FROM pizzeria WHERE id = 10;
DELETE FROM pizzeria WHERE id = 11;
DELETE FROM person_visits WHERE visit_date = '2022-02-24';
DELETE FROM person_order WHERE order_date = '2022-02-24';
DELETE FROM menu WHERE pizza_name = 'sicilian pizza';
DELETE FROM person_visits WHERE id = 22;*/