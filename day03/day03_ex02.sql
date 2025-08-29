SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria
ON pizzeria.id = menu.pizzeria_id
WHERE NOT EXISTS
(SELECT 1
FROM person_order
WHERE menu.id = person_order.menu_id)
ORDER BY pizza_name, price;