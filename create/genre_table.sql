-- Table: fridge-system.genre_table

-- DROP TABLE IF EXISTS "fridge-system".genre_table;

CREATE TABLE IF NOT EXISTS "fridge-system".genre_table
(
    id_genre integer NOT NULL DEFAULT nextval('"fridge-system".genre_table_id_genre_seq'::regclass),
    name_genre character varying(80) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_table_pkey PRIMARY KEY (id_genre)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".genre_table
    OWNER to postgres;