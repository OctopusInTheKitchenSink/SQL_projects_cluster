CREATE SEQUENCE seq_person_discounts START WITH 1
OWNED BY person_discounts.id;
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', COALESCE((SELECT MAX(id) + 1 FROM person_discounts), 1));

-- DELETE FROM person_visits WHERE visit_date = '2022-02-24';
-- DELETE FROM person_order WHERE order_date = '2022-02-24';
-- DELETE FROM menu WHERE pizza_name = 'sicilian pizza';
-- DELETE FROM person_visits WHERE id = 22;