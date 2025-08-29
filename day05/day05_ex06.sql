EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- Planning Time: 0.472 ms

CREATE INDEX idx_1 ON pizzeria(id, rating);

SET enable_seqscan=false;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
RESET enable_seqscan;

-- Planning Time: 0.327 ms

-- DROP INDEX idx_1;

-- Очищаем бд от результатов заданий day03
-- DELETE FROM person_visits WHERE visit_date = '2022-02-24';
-- DELETE FROM person_order WHERE order_date = '2022-02-24';
-- DELETE FROM menu WHERE pizza_name = 'sicilian pizza';