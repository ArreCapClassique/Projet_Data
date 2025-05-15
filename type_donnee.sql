CREATE OR REPLACE TABLE stg.transactions_libelles AS
SELECT
    mnt_depassement,
    mnt_pay,
    mnt_rem,
    ann_soin,
    mois_soin,
    CASE
        WHEN age = '0'  THEN '0-19 ANS'
        WHEN age = '20' THEN '20 - 29 ANS'
        WHEN age = '30' THEN '30 - 39 ANS'
        WHEN age = '40' THEN '40 - 49 ANS'
        WHEN age = '50' THEN '50 - 59 ANS'
        WHEN age = '60' THEN '60 - 69 ANS'
        WHEN age = '70' THEN '70 - 79 ANS'
        WHEN age = '80' THEN '80 ANS ET +'
        WHEN age = '99' THEN 'AGE INCONNU'
        ELSE NULL
    END AS age,
    CASE
        WHEN region_ben = '5'  THEN 'Régions et Départements d''outre-mer'
        WHEN region_ben = '11' THEN 'Ile-de-France'
        WHEN region_ben = '24' THEN 'Centre-Val de Loire'
        WHEN region_ben = '27' THEN 'Bourgogne-Franche-Comté'
        WHEN region_ben = '28' THEN 'Normandie'
        WHEN region_ben = '32' THEN 'Hauts-de-France - Nord-Pas-de-Calais-Picardie'
        WHEN region_ben = '44' THEN 'Grand Est'
        WHEN region_ben = '52' THEN 'Pays de la Loire'
        WHEN region_ben = '53' THEN 'Bretagne'
        WHEN region_ben = '75' THEN 'Aquitaine-Limousin-Poitou-Charentes'
        WHEN region_ben = '76' THEN 'Languedoc-Roussillon-Midi-Pyrénées'
        WHEN region_ben = '84' THEN 'Auvergne-Rhône-Alpes'
        WHEN region_ben = '93' THEN 'Provence-Alpes-Côte d''Azur et Corse'
        WHEN region_ben = '99' THEN 'Inconnu'
        ELSE NULL
    END AS region_ben,
    CASE
        WHEN sexe = '0' THEN 'INCONNU OU PERSONNE MORALE SANS CIVILITE'
        WHEN sexe = '1' THEN 'MASCULIN'
        WHEN sexe = '2' THEN 'FEMININ'
        WHEN sexe = '9' THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS sexe,
    CASE
        WHEN nat_assurance = '0'  THEN 'SANS OBJET'
        WHEN nat_assurance = '10' THEN 'MALADIE'
        WHEN nat_assurance = '11' THEN 'MALADIE COURS NAVIGATION > 6 MOIS'
        WHEN nat_assurance = '12' THEN 'MALADIE COURS NAVIGATION < 6 MOIS'
        WHEN nat_assurance = '22' THEN 'SOINS AUX INVALIDES DE GUERRE (CNMSS)'
        WHEN nat_assurance = '30' THEN 'MATERNITE'
        WHEN nat_assurance = '40' THEN 'AT ET MP'
        WHEN nat_assurance = '50' THEN 'DECES'
        WHEN nat_assurance = '70' THEN 'PRESTATIONS SUPPLEMENTAIRES'
        WHEN nat_assurance = '80' THEN 'INVALIDITE'
        WHEN nat_assurance = '90' THEN 'PREVENTION MALADIE'
        WHEN nat_assurance = '99' THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS nat_assurance,
    CASE
        WHEN type_envlp = '0'  THEN 'PRESTATIONS NON PRISE EN CHARGE PAR LE RG'
        WHEN type_envlp = '1'  THEN 'SOINS DE VILLE'
        WHEN type_envlp = '2'  THEN 'HOSPITALISATION ET MEDICO-SOCIALE ET CONSOMMATIONS INTERMEDIAIRES (MEDICAMENTS ET LPP)'
        WHEN type_envlp = '3'  THEN 'PRESTATIONS LEGALES ASSURANCE MALADIE HORS ENV.ONDAM'
        WHEN type_envlp = '4'  THEN 'PREVENTION'
        WHEN type_envlp = '5'  THEN 'FNAS'
        WHEN type_envlp = '6'  THEN 'IVG (VALEUR SUPPRIMEE)'
        WHEN type_envlp = '7'  THEN 'C2S, AME ou ACS'
        WHEN type_envlp = '8'  THEN 'ALSACE MOSELLE'
        WHEN type_envlp = '9'  THEN 'VALEUR INCONNUE'
        WHEN type_envlp = '98' THEN 'SANS OBJET'
        ELSE NULL
    END AS type_envlp,
    CASE
        WHEN nat_destinataire = '0'   THEN 'SANS OBJET'
        WHEN nat_destinataire = '11'  THEN 'Assuré'
        WHEN nat_destinataire = '12'  THEN 'Adresse Provisoire'
        WHEN nat_destinataire = '13'  THEN 'Conjoint divorcé'
        WHEN nat_destinataire = '14'  THEN 'Conjoint séparé'
        WHEN nat_destinataire = '15'  THEN 'Procuration'
        WHEN nat_destinataire = '16'  THEN 'Tutelle'
        WHEN nat_destinataire = '17'  THEN 'Veuvage'
        WHEN nat_destinataire = '18'  THEN 'Conjoint'
        WHEN nat_destinataire = '19'  THEN 'Enfant'
        WHEN nat_destinataire = '21'  THEN 'Autre ayant droit'
        WHEN nat_destinataire = '22'  THEN 'Concubin'
        WHEN nat_destinataire = '23'  THEN 'Ascendant, descendant'
        WHEN nat_destinataire = '24'  THEN 'Concubin en rupture'
        WHEN nat_destinataire = '25'  THEN 'Bénéficiaire Pacsé'
        WHEN nat_destinataire = '26'  THEN 'Pacs fin'
        WHEN nat_destinataire = '27'  THEN 'A-D- RESIDENCE UE'
        WHEN nat_destinataire = '31'  THEN 'Correspondant d''entreprise'
        WHEN nat_destinataire = '32'  THEN 'Mutuelle'
        WHEN nat_destinataire = '33'  THEN 'Subrogation'
        WHEN nat_destinataire = '34'  THEN 'Titre Médecin'
        WHEN nat_destinataire = '35'  THEN 'Tiers Payant'
        WHEN nat_destinataire = '36'  THEN 'Tiers Payant Intégral (RO+OC)'
        WHEN nat_destinataire = '37'  THEN 'Subrogation multiple'
        WHEN nat_destinataire = '38'  THEN 'TP RO + OC C2S'
        WHEN nat_destinataire = '99'  THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS nat_destinataire,
    CASE
        WHEN code_secteur = '1' THEN 'PUBLIC'
        WHEN code_secteur = '2' THEN 'PRIVE'
        WHEN code_secteur = '9' THEN 'INCONNUE'
        ELSE NULL
    END AS code_secteur,
    taux_remb,
    CASE
        WHEN type_remb = '0'  THEN 'PRESTATION DE REFERENCE'
        WHEN type_remb = '1'  THEN 'COMPLEMENT D ACTE'
        WHEN type_remb = '2'  THEN 'TICKET MODERATEUR HORS C2S'
        WHEN type_remb = '3'  THEN 'SUPPLEMENT HORS ALSACE MOSELLE'
        WHEN type_remb = '4'  THEN 'SUPPLEMENT ALSACE MOSELLE'
        WHEN type_remb = '5'  THEN 'TICKET MODERATEUR  C2S'
        WHEN type_remb = '6'  THEN 'FORFAIT C2S'
        WHEN type_remb = '7'  THEN 'AME'
        WHEN type_remb = '10' THEN 'Part oc ACS'
        WHEN type_remb = '11' THEN 'PART SPECIFIQUE CRPCEN'
        WHEN type_remb = '12' THEN 'PART SPECIFIQUE CANSSM'
        WHEN type_remb = '13' THEN 'TICKET MODERATEUR MAYOTTE'
        WHEN type_remb = '99' THEN 'VALEUR INCONNUE'
    ELSE NULL
    END AS type_remb,
    CASE
        WHEN forfait_journalier = '0' THEN 'REGIME'
        WHEN forfait_journalier = '1' THEN 'REGIME LOCAL ALSACE-MOSELLE'
        WHEN forfait_journalier = '2' THEN 'ASSURE'
        WHEN forfait_journalier = '3' THEN 'ORGANISME COMPLEMENTAIRE'
        WHEN forfait_journalier = '8' THEN 'SANS OBJET'
        WHEN forfait_journalier = '9' THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS forfait_journalier

FROM stg.transactions;