WITH orders AS(
    SELECT pizzeria.name AS name,
    COUNT(person_order.order_date) AS count_ord
    FROM person_order
    FULL JOIN menu
    ON person_order.menu_id = menu.id
    FULL JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
visits AS(
    SELECT pizzeria.name AS name,
    COUNT(person_visits.visit_date) AS count_vis
    FROM person_visits
    FULL JOIN pizzeria
    ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
)
SELECT pizzeria.name,
orders.count_ord + visits.count_vis AS total_count
FROM pizzeria
FULL JOIN orders ON orders.name = pizzeria.name
FULL JOIN visits ON visits.name = pizzeria.name
ORDER BY total_count DESC, name;