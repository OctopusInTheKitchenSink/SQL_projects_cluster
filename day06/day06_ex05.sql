COMMENT ON TABLE person_discounts IS 'Таблица отображает размер скидки для каждого, кто делал заказы в пицццериях, согласно количеству заказов';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный код поля таблицы';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор человека, который делал заказ (из таблицы заказов)';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, в которой был сделан заказ (из таблицы заказов)';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки';

-- \d+ person_discounts