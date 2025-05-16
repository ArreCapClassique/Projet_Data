CREATE SCHEMA IF NOT EXISTS stg;
CREATE OR REPLACE TABLE stg.transactions AS
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202401
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202402
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202403
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202404
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202405
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202406
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202407
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202408
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202409
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202410
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202411
GROUP BY ALL
UNION ALL
SELECT
    SUM(FLT_DEP_MNT) AS mnt_depassement,
    SUM(FLT_PAI_MNT) AS mnt_pay,
    SUM(FLT_REM_MNT) AS mnt_rem,
    SOI_ANN AS ann_soin,
    SOI_MOI AS mois_soin,
    AGE_BEN_SNDS AS age,
    BEN_RES_REG AS region_ben,
    BEN_SEX_COD AS sexe,
    ASU_NAT AS nat_assurance,
    CPT_ENV_TYP AS type_envlp,
    DRG_AFF_NAT AS nat_destinataire,
    PRS_FJH_TYP AS forfait_journalier,
    PRS_PPU_SEC AS code_secteur,
    PRS_REM_TYP AS type_remb
FROM raw.A202412
GROUP BY ALL;