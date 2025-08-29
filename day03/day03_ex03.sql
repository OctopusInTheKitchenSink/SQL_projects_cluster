WITH women_visits AS(
    SELECT person_visits.pizzeria_id, COUNT(*) AS w_visits_counter
    FROM person
    JOIN person_visits
    ON person.id = person_visits.person_id
    WHERE person.gender = 'female'
    GROUP BY person_visits.pizzeria_id
),
man_visits AS(
    SELECT person_visits.pizzeria_id, COUNT(*) AS m_visits_counter
    FROM person
    JOIN person_visits
    ON person_visits.person_id = person.id
    WHERE person.gender = 'male'
    GROUP BY person_visits.pizzeria_id
)
SELECT name AS pizzeria_name FROM pizzeria
JOIN women_visits
ON women_visits.pizzeria_id = pizzeria.id
JOIN man_visits
ON man_visits.pizzeria_id = pizzeria.id
WHERE w_visits_counter != m_visits_counter
ORDER BY pizzeria_name;