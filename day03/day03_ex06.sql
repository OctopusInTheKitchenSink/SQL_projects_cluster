WITH pizzeria_1 AS(
    SELECT menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name_1,
    menu.price AS price
    FROM menu
    JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id
),
pizzeria_2 AS(
    SELECT menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name_2,
    menu.price AS price
    FROM menu
    JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id
)
SELECT DISTINCT pizzeria_1.pizza_name, 
pizzeria_1.pizzeria_name_1, pizzeria_2.pizzeria_name_2,
pizzeria_1.price
FROM pizzeria_1, pizzeria_2
WHERE pizzeria_1.pizza_name = pizzeria_2.pizza_name
AND pizzeria_1.price = pizzeria_2.price AND 
pizzeria_1.pizzeria_name_1 > pizzeria_2.pizzeria_name_2
ORDER BY pizza_name;