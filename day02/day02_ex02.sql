SELECT 
COALESCE(person.name, '-') AS person_name, 
visit_date AS visit_date, 
COALESCE(pizzeria.name, '-') AS pizzeria_name 
FROM 
(SELECT DISTINCT person_id, pizzeria_id, visit_date 
FROM person_visits 
WHERE DATE(visit_date) BETWEEN '2022-01-01' AND '2022-01-03') AS pv
FULL JOIN person
ON person.id = pv.person_id
FULL JOIN pizzeria
ON pizzeria.id = pv.pizzeria_id
ORDER BY
person_name, visit_date, pizzeria_name;