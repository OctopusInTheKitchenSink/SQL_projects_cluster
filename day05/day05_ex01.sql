EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id;

SET enable_seqscan=false;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id;
RESET enable_seqscan;