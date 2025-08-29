SELECT date FROM v_generated_dates
LEFT JOIN
person_visits
ON v_generated_dates.date = person_visits.visit_date
WHERE NOT EXISTS(
    SELECT 1
    FROM person_visits
    WHERE v_generated_dates.date = person_visits.visit_date
);