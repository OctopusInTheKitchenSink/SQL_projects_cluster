INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT 
ROW_NUMBER() OVER (ORDER BY p.person_id, p.pizzeria_id) AS id,
p.person_id,
p.pizzeria_id,
CASE 
    WHEN p.order_counter = 1 THEN 10.5
    WHEN p.order_counter = 2 THEN 22
    WHEN p.order_counter > 2 THEN 30
END
FROM 
    (SELECT person_id, 
    (SELECT pizzeria_id FROM menu WHERE menu.id = person_order.menu_id), 
    COUNT(*) AS order_counter 
    FROM person_order
    GROUP BY person_id, pizzeria_id) AS p;