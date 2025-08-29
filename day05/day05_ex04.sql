CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan=false;
EXPLAIN ANALYZE
SELECT price
FROM menu
WHERE pizzeria_id = 4 AND pizza_name = 'mushroom pizza';
RESET enable_seqscan;