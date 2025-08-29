SELECT person.address,
ROUND((MAX(person.age) - MIN(person.age)::NUMERIC / MAX(person.age)), 2) AS formula,
ROUND(AVG(person.age), 2) AS average,
CASE
    WHEN MAX(person.age) - MIN(person.age) / MAX(person.age) > AVG(person.age) THEN 'true'
    ELSE 'false'
END AS comparison
FROM person
GROUP BY person.address
ORDER BY person.address;

/*DELETE FROM person_visits WHERE visit_date = '2022-02-24';
DELETE FROM person_order WHERE order_date = '2022-02-24';
DELETE FROM menu WHERE pizza_name = 'sicilian pizza';
DELETE FROM person_visits WHERE id = 22;*/