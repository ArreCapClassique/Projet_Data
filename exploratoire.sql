SELECT
    'age' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE age = 99) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE age = 99) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions