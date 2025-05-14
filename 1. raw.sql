CREATE SCHEMA IF NOT EXISTS raw;

CREATE TABLE IF NOT EXISTS raw.month1 AS
FROM read_csv("C:\Projet\Raw_data\A202401.parquet");

ALTER TABLE raw.month1
DROP IF EXISTS column54;