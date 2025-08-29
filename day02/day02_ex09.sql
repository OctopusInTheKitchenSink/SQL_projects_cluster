SELECT p1.name
FROM(
    (SELECT person.name
    FROM person
    JOIN person_order
    ON person_order.person_id = person.id
    JOIN menu
    ON menu.id = person_order.menu_id
    WHERE gender = 'female' AND menu.pizza_name  = 'cheese pizza') AS p2
    JOIN
    (SELECT person.name
    FROM person
    JOIN person_order
    ON person_order.person_id = person.id
    JOIN menu
    ON menu.id = person_order.menu_id
    WHERE gender = 'female' AND menu.pizza_name  = 'pepperoni pizza') AS p1
    ON p1.name = p2.name
);