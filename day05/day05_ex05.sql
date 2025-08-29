CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(person_id, menu_id)
WHERE DATE(order_date) = '2022-01-01';

SET enable_seqscan=false;
EXPLAIN ANALYZE
SELECT person.name, menu.pizza_name
FROM person_order
JOIN person
ON person.id = person_order.person_id
JOIN menu 
ON menu.id = person_order.menu_id 
WHERE DATE(order_date) = '2022-01-01';
RESET enable_seqscan;