-- Table: fridge-system.recipe_table

-- DROP TABLE IF EXISTS "fridge-system".recipe_table;

CREATE TABLE IF NOT EXISTS "fridge-system".recipe_table
(
    id_recipe integer NOT NULL DEFAULT nextval('"fridge-system".recipe_table_id_recipe_seq'::regclass),
    name_recipe character varying(80) COLLATE pg_catalog."default" NOT NULL,
    "serving size" smallint,
    method character varying(2000) COLLATE pg_catalog."default",
    CONSTRAINT recipe_table_pkey PRIMARY KEY (id_recipe)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".recipe_table
    OWNER to postgres;