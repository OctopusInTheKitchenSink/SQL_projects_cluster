SELECT days FROM (SELECT generate_series::date FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)) AS g(days)
LEFT JOIN
person_visits
ON g.days = person_visits.visit_date AND person_visits.person_id IN (1, 2)
WHERE person_visits.visit_date IS NULL;