insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH find_min_max AS (
    SELECT
        b.user_id,
        b.currency_id,
        b.updated,
        c.name AS currency_name,
        b.money,
        (SELECT rate_to_usd FROM currency c2 WHERE c2.id = b.currency_id AND c2.updated <= b.updated ORDER BY updated DESC LIMIT 1) AS rate_to_usd_min,
        (SELECT rate_to_usd FROM currency c2 WHERE c2.id = b.currency_id AND c2.updated >  b.updated ORDER BY updated ASC LIMIT 1) AS rate_to_usd_max
    FROM balance b
    JOIN currency c ON b.currency_id = c.id
	GROUP BY b.user_id, b.currency_id, b.updated, c.name, b.money
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    fmm.currency_name,
    (fmm.money * COALESCE(fmm.rate_to_usd_min, fmm.rate_to_usd_max)) AS currency_in_usd
FROM find_min_max fmm
LEFT JOIN "user" u ON fmm.user_id = u.id
ORDER BY name DESC, lastname, currency_name;