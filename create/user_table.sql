-- Table: fridge-system.user_table

-- DROP TABLE IF EXISTS "fridge-system".user_table;

CREATE TABLE IF NOT EXISTS "fridge-system".user_table
(
    id_user integer NOT NULL DEFAULT nextval('"fridge-system".user_table_userid_seq'::regclass),
    name_user character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mail character varying(253) COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    salt character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_table_pkey PRIMARY KEY (id_user)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".user_table
    OWNER to postgres;