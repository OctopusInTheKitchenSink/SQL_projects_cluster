SELECT person.name AS name,
COUNT(person_visits.visit_date) AS count_of_visits
FROM person_visits
JOIN person
ON person_visits.person_id = person.id
GROUP BY person.name
HAVING COUNT(person_visits.visit_date) > 3;
-- как и where, но только после группировки