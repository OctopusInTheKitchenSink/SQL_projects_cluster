SELECT person.name, menu.pizza_name, menu.price,
(menu.price - menu.price * person_discounts.discount / 100)::integer AS discount_price,
pizzeria.name AS pizzeria_name
FROM person_discounts
JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
JOIN person ON person.id = person_discounts.person_id
JOIN menu ON pizzeria.id = menu.pizzeria_id
ORDER BY name, pizza_name;