ALTER TABLE stg.transactions
    ALTER COLUMN mnt_depassement   SET DATA TYPE FLOAT,
    ALTER COLUMN mnt_pay           SET DATA TYPE FLOAT,
    ALTER COLUMN mnt_rem           SET DATA TYPE FLOAT,
    ALTER COLUMN ann_soin          SET DATA TYPE INTEGER,
    ALTER COLUMN mois_soin         SET DATA TYPE INTEGER,
    ALTER COLUMN age               SET DATA TYPE VARCHAR(20),
    ALTER COLUMN region_ben        SET DATA TYPE VARCHAR(100),
    ALTER COLUMN sexe              SET DATA TYPE VARCHAR(50),
    ALTER COLUMN ticket_mod        SET DATA TYPE VARCHAR(100),
    ALTER COLUMN nat_assurance     SET DATA TYPE VARCHAR(200),
    ALTER COLUMN type_envlp        SET DATA TYPE VARCHAR(200),
    ALTER COLUMN nat_destinataire  SET DATA TYPE VARCHAR(200),
    ALTER COLUMN motif_exo         SET DATA TYPE VARCHAR(200),
    ALTER COLUMN nat_prestation    SET DATA TYPE VARCHAR(200),
    ALTER COLUMN code_secteur      SET DATA TYPE VARCHAR(10),
    ALTER COLUMN taux_remb         SET DATA TYPE FLOAT,
    ALTER COLUMN type_remb         SET DATA TYPE VARCHAR(50);

    
CREATE OR REPLACE TABLE stg.month1_libelles AS
SELECT
    mnt_depassement,
    mnt_pay,
    mnt_rem,
    ann_soin,
    mois_soin,

    -- Tranche d'âge (libellé)
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

    -- Région de résidence (libellé)
    CASE
        WHEN region_ben = '5'  THEN 'Régions et Départements d\'outre-mer'
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
        WHEN region_ben = '93' THEN 'Provence-Alpes-Côte d\'Azur et Corse'
        WHEN region_ben = '99' THEN 'Inconnu'
        ELSE NULL
    END AS region_ben,

    -- Sexe (libellé)
    CASE
        WHEN sexe = '0' THEN 'INCONNU OU PERSONNE MORALE SANS CIVILITE'
        WHEN sexe = '1' THEN 'MASCULIN'
        WHEN sexe = '2' THEN 'FEMININ'
        WHEN sexe = '9' THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS sexe,

    -- Nature d'assurance (libellé)
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

    -- Type d'enveloppe (libellé)
    CASE
        WHEN type_env = '0'  THEN 'PRESTATIONS NON PRISE EN CHARGE PAR LE RG'
        WHEN type_env = '1'  THEN 'SOINS DE VILLE'
        WHEN type_env = '2'  THEN 'HOSPITALISATION ET MEDICO-SOCIALE ET CONSOMMATIONS INTERMEDIAIRES (MEDICAMENTS ET LPP)'
        WHEN type_env = '3'  THEN 'PRESTATIONS LEGALES ASSURANCE MALADIE HORS ENV.ONDAM'
        WHEN type_env = '4'  THEN 'PREVENTION'
        WHEN type_env = '5'  THEN 'FNAS'
        WHEN type_env = '6'  THEN 'IVG (VALEUR SUPPRIMEE)'
        WHEN type_env = '7'  THEN 'C2S, AME ou ACS'
        WHEN type_env = '8'  THEN 'ALSACE MOSELLE'
        WHEN type_env = '9'  THEN 'VALEUR INCONNUE'
        WHEN type_env = '98' THEN 'SANS OBJET'
        ELSE NULL
    END AS type_env,

    CASE
        WHEN ticket_mod = '0'  THEN 'PRESTATION DE REFERENCE'
        WHEN ticket_mod = '1'  THEN 'COMPLEMENT D ACTE'
        WHEN ticket_mod = '2'  THEN 'TICKET MODERATEUR HORS C2S'
        WHEN ticket_mod = '3'  THEN 'SUPPLEMENT HORS ALSACE MOSELLE'
        WHEN ticket_mod = '4'  THEN 'SUPPLEMENT ALSACE MOSELLE'
        WHEN ticket_mod = '5'  THEN 'TICKET MODERATEUR  C2S'
        WHEN ticket_mod = '6'  THEN 'FORFAIT C2S'
        WHEN ticket_mod = '7'  THEN 'AME'
        WHEN ticket_mod = '10' THEN 'Part oc ACS'
        WHEN ticket_mod = '11' THEN 'PART SPECIFIQUE CRPCEN'
        WHEN ticket_mod = '12' THEN 'PART SPECIFIQUE CANSSM'
        WHEN ticket_mod = '13' THEN 'TICKET MODERATEUR MAYOTTE'
        WHEN ticket_mod = '99' THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS ticket_mod,
    CASE
        WHEN motif_exo = '0'   THEN 'SANS OBJET'
        WHEN motif_exo = '10'  THEN 'ASSURANCE'
        WHEN motif_exo = '20'  THEN 'REGIMES'
        WHEN motif_exo = '21'  THEN 'PENSION MILITAIRE D''INVALIDITE (ART. 115)'
        WHEN motif_exo = '30'  THEN 'NATURE DE PRESTATION'
        WHEN motif_exo = '41'  THEN 'BENEFICIAIRE ATTEINT D UNE MALADIE LISTE - AFFECTION SANS RAPPORT'
        WHEN motif_exo = '42'  THEN 'BENEFICIAIRE ATTEINT D UNE MALADIE LISTE - AFFECTION EN  RAPPORT'
        WHEN motif_exo = '43'  THEN 'PATHOLOGIE HORS LISTE - AFFECTION SANS RAPPORT'
        WHEN motif_exo = '44'  THEN 'PATHOLOGIE HORS LISTE - AFFECTION EN RAPPORT'
        WHEN motif_exo = '45'  THEN 'POLYPATHOLOGIE HORS LISTE - AFFECTION SANS RAPPORT'
        WHEN motif_exo = '46'  THEN 'POLYPATHOLOGIE HORS LISTE - AFFECTION EN RAPPORT'
        WHEN motif_exo = '47'  THEN 'ARTICLE L324 NON EXONERANT (SAUF TRANSPORTS)'
        WHEN motif_exo = '51'  THEN 'COEFFICIENT ET ACTE EN RAPPORT'
        WHEN motif_exo = '52'  THEN 'DIAGNOSTIC ET TRAITEMENT DE LA STERILITE'
        WHEN motif_exo = '53'  THEN '6EME MOIS DE GROSSESSE'
        WHEN motif_exo = '54'  THEN 'EDUCATION SPECIALISEE SANS RAPPORT'
        WHEN motif_exo = '55'  THEN 'EDUCATION SPECIALISEE EN RAPPORT'
        WHEN motif_exo = '56'  THEN 'AUTRE CAS D EXONERATION'
        WHEN motif_exo = '62'  THEN 'HOSPIT JOUR/SOS'
        WHEN motif_exo = '81'  THEN 'PREVENTION'
        WHEN motif_exo = '82'  THEN 'PREVENTION SOINS DE SUITE BUCCO-DENTAIRE'
        WHEN motif_exo = '83'  THEN 'ACTES CCAM/NAP EXONERANTS'
        WHEN motif_exo = '92'  THEN 'SOINS EN RAPPORT AVEC UN ACTE CCAM EXONERANT'
        WHEN motif_exo = '99'  THEN 'VALEUR INCONNUE'
        ELSE NULL
    END AS motif_exo,

    -- Nature du Destinataire du Règlement Affiné (libellé)
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
    END AS nat_assurance
  
    CASE
        WHEN type_env = '0'  THEN 'PRESTATIONS NON PRISE EN CHARGE PAR LE RG'
        WHEN type_env = '1'  THEN 'SOINS DE VILLE'
        WHEN type_env = '2'  THEN 'HOSPITALISATION ET MEDICO-SOCIALE ET CONSOMMATIONS INTERMEDIAIRES (MEDICAMENTS ET LPP)'
        WHEN type_env = '3'  THEN 'PRESTATIONS LEGALES ASSURANCE MALADIE HORS ENV.ONDAM'
        WHEN type_env = '4'  THEN 'PREVENTION'
        WHEN type_env = '5'  THEN 'FNAS'
        WHEN type_env = '6'  THEN 'IVG (VALEUR SUPPRIMEE)'
        WHEN type_env = '7'  THEN 'C2S, AME ou ACS'
        WHEN type_env = '8'  THEN 'ALSACE MOSELLE'
        WHEN type_env = '9'  THEN 'VALEUR INCONNUE'
        WHEN type_env = '98' THEN 'SANS OBJET'
        ELSE NULL
    END AS type_env,

FROM stg.transactions;

