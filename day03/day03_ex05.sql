WITH visited AS(
    SELECT pizzeria.name AS pizzeria_name,
    person_visits.visit_date FROM pizzeria 
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.name = 'Andrey'
),
ordered AS(
    SELECT pizzeria.name AS pizzeria_name,
    person_order.order_date FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE person.name = 'Andrey'
)
SELECT visited.pizzeria_name FROM visited
WHERE NOT EXISTS(
    SELECT 1
    FROM ordered
    WHERE visited.visit_date = ordered.order_date
)
ORDER BY pizzeria_name;