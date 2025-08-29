CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy', pprice numeric DEFAULT 500, pdate DATE DEFAULT '2022-01-08') 
RETURNS TABLE (name varchar) AS $$
BEGIN
    RETURN QUERY
    -- обозначает что следующий запрос - результат функции
    SELECT DISTINCT pizzeria.name
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.name = pperson AND menu.price < pprice AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

-- DROP FUNCTION fnc_person_visits_and_eats_on_date(varchar, numeric, date);

/*select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');*/