-- Table: fridge-system.unit_table

-- DROP TABLE IF EXISTS "fridge-system".unit_table;

CREATE TABLE IF NOT EXISTS "fridge-system".unit_table
(
    id_unit integer NOT NULL DEFAULT nextval('"fridge-system".unit_table_id_unit_seq'::regclass),
    name_unit character varying(5) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT unit_table_pkey PRIMARY KEY (id_unit)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".unit_table
    OWNER to postgres;