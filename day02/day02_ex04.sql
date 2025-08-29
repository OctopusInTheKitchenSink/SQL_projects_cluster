SELECT
menu.pizza_name AS pizza_name,
name AS pizzeria_name,
menu.price AS price
FROM pizzeria
FULL JOIN
menu
ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name in ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name;