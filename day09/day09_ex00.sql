/* Выполняем задания day03 ex 07 - 13 по тз
INSERT INTO menu(id, pizzeria_id, pizza_name, price) VALUES(
    (SELECT MAX(id) + 1 FROM menu),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    'sicilian pizza', 900
);

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES
    ((SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24');

INSERT INTO person_order(id, person_id, menu_id, order_date)
VALUES
    ((SELECT MAX(id) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_order),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24');

-- day04_ex07

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS(
    SELECT pizzeria.name FROM pizzeria
    JOIN person_visits
    ON pizzeria.id = person_visits.pizzeria_id
    JOIN person
    ON person.id = person_visits.person_id
    JOIN menu
    ON menu.pizzeria_id = pizzeria.id 
    WHERE person_visits.visit_date = '2022-01-08' AND
    person.name = 'Dmitriy' AND menu.price < 800
);

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES(
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT person.id FROM person WHERE name = 'Dmitriy'),
    (SELECT pizzeria.id FROM pizzeria
    INNER JOIN menu
    ON menu.pizzeria_id = pizzeria.id
    INNER JOIN mv_dmitriy_visits_and_eats 
    ON mv_dmitriy_visits_and_eats.name != pizzeria.name
    WHERE menu.price < 800 LIMIT 1
    ),
    '2022-01-08'
);
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

*/

CREATE TABLE person_audit(
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event char(1) DEFAULT 'I' CHECK (type_event IN ('I', 'U', 'D')),
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $$
BEGIN 
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) 
        VALUES(NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- NEW содержит копию новой строки, которая была только что добавлена

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
