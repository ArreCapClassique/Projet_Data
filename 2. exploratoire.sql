SELECT
    'ann_soin' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE ann_soin IN (0, '0001')) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'mois_soin' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE mois_soin = 0) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'age' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE age = 99) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'region_ben' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE region_ben = 99) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'sexe' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE sexe = 99) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'nat_assurance' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE nat_assurance IN (0, 99)) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'type_envlp' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE type_envlp IN (9, 98)) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'nat_destinataire' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE nat_destinataire IN (0, 99)) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'code_secteur' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE code_secteur = 9) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'type_remb' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE type_remb = 99) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'forfait_journalier' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE forfait_journalier IN (8, 9)) AS nb_unutilisable,
    ROUND(nb_unutilisable / nb_total, 6) AS pct_unutilisable
FROM stg.transactions
ORDER BY column_name;