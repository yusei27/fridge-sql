-- Table: fridge-system.ingredient_table

-- DROP TABLE IF EXISTS "fridge-system".ingredient_table;

CREATE TABLE IF NOT EXISTS "fridge-system".ingredient_table
(
    id_ingredient integer NOT NULL DEFAULT nextval('"fridge-system".id_ingredient_id_ingredient_seq'::regclass),
    name_ingredient character varying(80) COLLATE pg_catalog."default",
    fk_id_unit integer NOT NULL,
    fk_id_genre integer NOT NULL,
    CONSTRAINT id_ingredient_pkey PRIMARY KEY (id_ingredient),
    CONSTRAINT ingredient_table_fk_id_genre_fkey FOREIGN KEY (fk_id_genre)
        REFERENCES "fridge-system".genre_table (id_genre) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ingredient_table_fk_id_unit_fkey FOREIGN KEY (fk_id_unit)
        REFERENCES "fridge-system".unit_table (id_unit) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".ingredient_table
    OWNER to postgres;