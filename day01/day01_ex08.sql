SELECT
    order_date,
    (SELECT info.name || ' (age:' || info.age || ')' AS person_information)
FROM
    person_order
NATURAL JOIN
    (SELECT 
    name, 
    age, 
    id AS person_id 
    FROM 
        person) 
    AS info
ORDER BY
    order_date,
    person_information;