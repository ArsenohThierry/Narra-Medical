CREATE DATABASE medical;
\C medical

CREATE TABLE patients (
    id VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    telephone VARCHAR(20),
    email VARCHAR(150)
);

-- Creer une sequence 
CREATE SEQUENCE seq_patient
START WITH 1
INCREMENT BY 1;


-- Creer une fonction qui genere une nouvelle ID Patient (comme sur apj)

CREATE OR REPLACE FUNCTION generer_id_patient()
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
    nouvel_id VARCHAR(20);
BEGIN
    nouvel_id := 'PAT' || LPAD(NEXTVAL('seq_patient')::TEXT, 6, '0');

    RETURN nouvel_id;
END;
$$;

INSERT INTO patients (id, nom, prenom, telephone, email)
VALUES (
    generer_id_patient(),
    'Rakoto',
    'Jean',
    '0341234567',
    'jean@gmail.com'
);

CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO utilisateurs (login, password)
VALUES ('admin', 'admin');

CREATE TABLE medecins(
    id VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    specialite VARCHAR(100),
    telephone VARCHAR(20),
    email VARCHAR(150)
);

-- Creer une sequence 
CREATE SEQUENCE seq_MEDECIN
START WITH 1
INCREMENT BY 1;



-- Creer une fonction qui genere une nouvelle ID Medecin (comme sur apj)

CREATE OR REPLACE FUNCTION generer_id_medecin()
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
    nouvel_id VARCHAR(20);
BEGIN
    nouvel_id := 'MED' || LPAD(NEXTVAL('seq_MEDECIN')::TEXT, 6, '0');

    RETURN nouvel_id;
END;
$$;


ALTER TABLE utilisateurs ADD COLUMN id_medecin VARCHAR(20);

ALTER TABLE utilisateurs ADD CONSTRAINT fk_utilisateur_medecin FOREIGN KEY (id_medecin) REFERENCES medecins(id);