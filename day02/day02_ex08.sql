SELECT
person.name
FROM person
JOIN person_order
ON person.id = person_order.person_id
JOIN menu
ON menu.id = person_order.menu_id
WHERE person.address IN ('Moscow', 'Samara') AND 
menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
AND person.gender = 'male'
ORDER BY person.name DESC;