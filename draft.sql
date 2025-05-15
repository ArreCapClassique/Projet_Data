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