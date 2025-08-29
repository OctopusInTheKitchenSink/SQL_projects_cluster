SELECT
    person_id
FROM
    (SELECT 
        person_id,
        order_date
    FROM
        person_order
    WHERE
        DATE(order_date) = '2022-01-07'
    EXCEPT ALL
    SELECT
        person_id,
        visit_date
    FROM
        person_visits
    WHERE
        DATE(visit_date) = '2022-01-07');