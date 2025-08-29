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
*/

CREATE INDEX idx_person_visits_person_id ON person_visits(person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits(pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order(person_id);
CREATE INDEX idx_person_order_menu_id ON person_order(menu_id);
CREATE INDEX idx_menu_pizzeria_id ON menu(pizzeria_id);