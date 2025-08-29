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

day04_ex07

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

CREATE TABLE person_discounts(
    id bigint PRIMARY KEY,
    person_id bigint,
    pizzeria_id bigint,
    discount numeric,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) references person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) references pizzeria(id)
);