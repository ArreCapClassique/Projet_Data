CREATE SCHEMA IF NOT EXISTS dwh;

CREATE OR REPLACE TABLE dwh.dim_periode AS
SELECT
    ROW_NUMBER() OVER (ORDER BY ann_soin, mois_soin) AS id_periode,
    MD5(CONCAT(ann_soin, mois_soin)) AS cd_periode,
    ann_soin, mois_soin
FROM (
    SELECT DISTINCT ann_soin, mois_soin
    FROM stg.transactions_libelles
);

CREATE OR REPLACE TABLE dwh.dim_beneficiaire AS
SELECT
    ROW_NUMBER() OVER (ORDER BY age, region_ben, sexe, ticket_mod) AS id_beneficiaire,
    MD5(CONCAT(age, region_ben, sexe, ticket_mod)) AS cd_beneficiaire,
    age, region_ben, sexe, ticket_mod
FROM (
    SELECT DISTINCT age, region_ben, sexe, ticket_mod
    FROM stg.transactions_libelles
);

CREATE OR REPLACE TABLE dwh.dim_prestation AS
SELECT
    ROW_NUMBER() OVER (ORDER BY nat_assurance, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb) AS id_prestation,
    MD5(CONCAT(nat_assurance, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb)) AS cd_prestation,
    nat_assurance, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb
FROM (
    SELECT DISTINCT nat_assurance, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb
    FROM stg.transactions_libelles
);

CREATE OR REPLACE TABLE dwh.fct_soins AS
SELECT
    dp.id_periode,
    db.id_beneficiaire,
    dpr.id_prestation,
    tl.mnt_depassement,
    tl.mnt_pay,
    tl.mnt_rem
FROM stg.transactions_libelles tl
JOIN dwh.dim_periode dp
  ON dp.cd_periode = MD5(CONCAT(tl.ann_soin, tl.mois_soin))
JOIN dwh.dim_beneficiaire db
  ON db.cd_beneficiaire = MD5(CONCAT(tl.age, tl.region_ben, tl.sexe, tl.ticket_mod))
JOIN dwh.dim_prestation dpr
  ON dpr.cd_prestation = MD5(CONCAT(
      tl.nat_assurance, tl.type_env,
      tl.nat_destinataire, tl.motif_exo, tl.nat_prestation,
      tl.code_secteur, tl.taux_remb, tl.type_remb
  ));

FROM dwh.fct_soins;

/*
COPY dwh.dim_periode TO 'C:\Projet\dwh.dim_periode.parquet' (FORMAT parquet);
COPY dwh.dim_beneficiaire TO 'C:\Projet\dwh.dim_beneficiaire.parquet' (FORMAT parquet);
COPY dwh.dim_prestation TO 'C:\Projet\dwh.dim_prestation.parquet' (FORMAT parquet);
COPY dwh.fct_soins TO 'C:\Projet\dwh.fct_soins.parquet' (FORMAT parquet);
*/

COPY dwh.dim_periode TO 'C:\Projet\dwh.dim_periode.csv' (HEADER, DELIMITER ',');
COPY dwh.dim_beneficiaire TO 'C:\Projet\dwh.dim_beneficiaire.csv' (HEADER, DELIMITER ',');
COPY dwh.dim_prestation TO 'C:\Projet\dwh.dim_prestation.csv' (HEADER, DELIMITER ',');
COPY dwh.fct_soins TO 'C:\Projet\dwh.fct_soins.csv' (HEADER, DELIMITER ',');