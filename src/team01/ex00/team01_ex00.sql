WITH curr_info AS(
    SELECT 
        type, 
        SUM(money) AS volume, 
        user_id, 
        currency_id
    FROM balance
    GROUP BY user_id, currency_id, type
), change_info AS(
    SELECT DISTINCT ON(id)
        id, 
        name AS currency_name, 
        rate_to_usd,
        updated
    FROM currency
    ORDER BY id, updated DESC
) SELECT 
    COALESCE(private_info.name, 'not defined') AS name, 
    COALESCE(private_info.lastname, 'not defined') AS lastname, 
    curr_info.type, 
    curr_info.volume, 
    COALESCE(change_info.currency_name, 'not defined'), 
    COALESCE(change_info.rate_to_usd, 1) AS last_rate_to_usd, 
    curr_info.volume * COALESCE(change_info.rate_to_usd, 1) AS total_volume_in_usd 
    FROM curr_info
LEFT JOIN "user" AS private_info 
ON curr_info.user_id = private_info.id
LEFT JOIN change_info 
ON curr_info.currency_id = change_info.id
ORDER BY 
    name DESC,
    lastname ASC,
    type ASC;