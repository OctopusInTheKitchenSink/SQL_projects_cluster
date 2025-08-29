SELECT 
    name || ' (age:' || age || ',gender:''' || gender || ',adress:''' || address|| ''')' AS person_information
FROM
    person
ORDER BY
    person_information;