WITH missing_days AS
(SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS days)
SELECT days::date FROM missing_days
WHERE NOT EXISTS
(SELECT 1
FROM person_visits
WHERE person_id IN (1, 2) AND visit_date::date = days);