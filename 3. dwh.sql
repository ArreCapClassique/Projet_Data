CREATE SCHEMA IF NOT EXISTS dwh;

CREATE OR REPLACE TABLE dwh.dim_periode AS
SELECT
    ROW_NUMBER() OVER (ORDER BY ann_soin, mois_soin) AS id_periode,
    MD5(CONCAT(ann_soin, mois_soin)) AS cd_periode,
    ann_soin, mois_soin
FROM (
    SELECT DISTINCT ann_soin, mois_soin
    FROM stg.month1
);

CREATE OR REPLACE TABLE dwh.dim_beneficiaire AS
SELECT
    ROW_NUMBER() OVER (ORDER BY age, region_ben, sexe, ticket_mod) AS id_beneficiaire,
    MD5(CONCAT(age, region_ben, sexe, ticket_mod)) AS cd_beneficiaire,
    age, region_ben, sexe, ticket_mod
FROM (
    SELECT DISTINCT age, region_ben, sexe, ticket_mod
    FROM stg.month1
);

FROM dwh.dim_beneficiaire;

CREATE OR REPLACE TABLE dwh.dim_prestation AS
SELECT
    ROW_NUMBER() OVER (ORDER BY nat_assurance, nat_accident, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb) AS id_prestation,
    MD5(CONCAT(nat_assurance, nat_accident, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb)) AS cd_prestation,
    nat_assurance, nat_accident, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb
FROM (
    SELECT DISTINCT nat_assurance, nat_accident, type_env, nat_destinataire, motif_exo, nat_prestation, code_secteur, taux_remb, type_remb
    FROM stg.month1
);

CREATE OR REPLACE TABLE dwh.fct_soins AS
SELECT
    dp.id_periode,
    db.id_beneficiaire,
    dpr.id_prestation,
    m1.mnt_depassement,
    m1.mnt_pay,
    m1.mnt_rem
FROM stg.month1 m1
JOIN dwh.dim_periode dp
  ON dp.cd_periode = MD5(CONCAT(m1.ann_soin, m1.mois_soin))
JOIN dwh.dim_beneficiaire db
  ON db.cd_beneficiaire = MD5(CONCAT(m1.age, m1.region_ben, m1.sexe, m1.ticket_mod))
JOIN dwh.dim_prestation dpr
  ON dpr.cd_prestation = MD5(CONCAT(
      m1.nat_assurance, m1.nat_accident, m1.type_env,
      m1.nat_destinataire, m1.motif_exo, m1.nat_prestation,
      m1.code_secteur, m1.taux_remb, m1.type_remb
  ));

FROM dwh.fct_soins;


COPY dwh.dim_periode TO 'C:\Projet\dwh.dim_periode.parquet' (FORMAT parquet);
COPY dwh.dim_beneficiaire TO 'C:\Projet\dwh.dim_beneficiaire.parquet' (FORMAT parquet);
COPY dwh.dim_prestation TO 'C:\Projet\dwh.dim_prestation.parquet' (FORMAT parquet);
COPY dwh.fct_soins TO 'C:\Projet\dwh.fct_soins.parquet' (FORMAT parquet);


SELECT
	ann_soin,
	MAX(mnt_depassement)
FROM dwh.fct_soins
JOIN dwh.dim_periode ON dwh.fct_soins.id_periode = dwh.dim_periode.id_periode
GROUP BY ann_soin
ORDER BY MAX(mnt_depassement) DESC;

SELECT 
	age,
	region_ben,
	max(mnt_pay)
FROM dwh.fct_soins
JOIN dwh.dim_beneficiaire ON dwh.fct_soins.id_beneficiaire = dwh.dim_beneficiaire.id_beneficiaire 
GROUP BY age, region_ben 
HAVING age > 50
ORDER BY age, region_ben;


SELECT ann_soin, COUNT(*)
FROM dwh.fct_soins
JOIN dwh.dim_periode on projet.dwh.fct_soins.id_periode = projet.dwh.dim_periode.id_periode 
GROUP BY ann_soin
ORDER BY ann_soin;