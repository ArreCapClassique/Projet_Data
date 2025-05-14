CREATE SCHEMA IF NOT EXISTS stg;

CREATE OR REPLACE TABLE stg.month1 AS
SELECT
	FLT_DEP_MNT mnt_depassement,
	FLT_PAI_MNT mnt_pay,
	FLT_REM_MNT mnt_rem,
	SOI_ANN ann_soin,
	SOI_MOI mois_soin,
	AGE_BEN_SNDS age,
	BEN_RES_REG region_ben,
	BEN_SEX_COD sexe,
	MTM_NAT ticket_mod,
	ASU_NAT nat_assurance,
	ATT_NAT nat_accident,
	CPT_ENV_TYP type_env,
	DRG_AFF_NAT nat_destinataire,
	EXO_MTF motif_exo,
	PRS_NAT nat_prestation,
	PRS_PPU_SEC code_secteur,
	PRS_REM_TAU taux_remb,
	PRS_REM_TYP type_remb
FROM raw.month1;

FROM stg.month1;


