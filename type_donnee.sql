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
    ALTER COLUMN type_envlp          SET DATA TYPE VARCHAR(200),
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

    -- Modulation ticket modérateur (libellé)
    -- (Remplacer le mapping ci-dessous si tu as le détail)
    ticket_mod, -- à remplacer par le CASE WHEN si tu as le mapping

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

    nat_destinataire,
    motif_exo,
    nat_prestation,
    code_secteur,
    taux_remb,
    type_remb

FROM stg.transactions;

