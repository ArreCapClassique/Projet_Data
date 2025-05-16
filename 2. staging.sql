CREATE SCHEMA IF NOT EXISTS stg;

CREATE OR REPLACE TABLE stg.transactions AS
SELECT
	FLT_DEP_MNT mnt_depassement,
	FLT_PAI_MNT mnt_pay,
	FLT_REM_MNT mnt_rem,
	SOI_ANN ann_soin,
	SOI_MOI mois_soin,
	AGE_BEN_SNDS age,
	BEN_RES_REG region_ben,
	BEN_SEX_COD sexe,
	ASU_NAT nat_assurance,
	CPT_ENV_TYP type_envlp,
	DRG_AFF_NAT nat_destinataire,
    PRS_FJH_TYP forfait_journalier,
	PRS_PPU_SEC code_secteur,
	PRS_REM_TAU taux_remb,
	PRS_REM_TYP type_remb
FROM raw.A2024*
LIMIT 5;

FROM stg.transactions;


