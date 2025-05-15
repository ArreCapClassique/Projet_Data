SELECT
    'ann_soin' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE ann_soin IN (0000, 0001)) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE ann_soin IN (0000, 0001)) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'mois_soin',
    COUNT(*),
    COUNT(*) FILTER (WHERE mois_soin = 00) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE mois_soin = 00) AS FLOAT) / COUNT(*), 6
    )
FROM stg.transactions
UNION ALL
SELECT
    'age',
    COUNT(*),
    COUNT(*) FILTER (WHERE age = 99),
    ROUND(
        CAST(COUNT(*) FILTER (WHERE age = 99) AS FLOAT) / COUNT(*), 6
    )
FROM stg.transactions
UNION ALL
SELECT
    'region_ben',
    COUNT(*),
    COUNT(*) FILTER (WHERE region_ben = 99),
    ROUND(
        CAST(COUNT(*) FILTER (WHERE region_ben = 99) AS FLOAT) / COUNT(*), 6
    )
FROM stg.transactions
UNION ALL
SELECT
    'sexe',
    COUNT(*),
    COUNT(*) FILTER (WHERE sexe IN (0, 9)),
    ROUND(
        CAST(COUNT(*) FILTER (WHERE sexe IN (0, 9)) AS FLOAT) / COUNT(*), 6
    )
FROM stg.transactions
UNION ALL
SELECT
    'nat_assurance',
    COUNT(*),
    COUNT(*) FILTER (WHERE nat_assurance IN (0, 99)),
    ROUND(
        CAST(COUNT(*) FILTER (WHERE nat_assurance IN (0, 99)) AS FLOAT) / COUNT(*), 6
    )
FROM stg.transactions
UNION ALL
SELECT
    'type_envlp' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE type_envlp IN (9, 98)) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE type_envlp IN (9, 98)) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'nat_destinataire' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE nat_destinataire = 0 or nat_destinataire = 99) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE nat_destinataire = 0 or nat_destinataire = 99) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'code_secteur' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE code_secteur = 9) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE code_secteur = 9) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'type_remb' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE type_remb = 99) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE type_remb = 99) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions
UNION ALL
SELECT
    'forfait_journalier' AS column_name,
    COUNT(*) AS nb_total,
    COUNT(*) FILTER (WHERE forfait_journalier = 8 or forfait_journalier = 9) AS nb_unutilisable,
    ROUND(
        CAST(COUNT(*) FILTER (WHERE forfait_journalier = 8 or forfait_journalier = 9) AS FLOAT) / COUNT(*), 6
    ) AS pct_unutilisable
FROM stg.transactions
ORDER BY column_name;