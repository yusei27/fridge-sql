-- Table: fridge-system.user_table

-- DROP TABLE IF EXISTS "fridge-system".user_table;

CREATE TABLE IF NOT EXISTS "fridge-system".user_table
(
    userid integer NOT NULL DEFAULT nextval('"fridge-system".user_table_userid_seq'::regclass),
    username character varying(20)[] COLLATE pg_catalog."default" NOT NULL,
    mail character varying(253)[] COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_table_pkey PRIMARY KEY (userid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".user_table
    OWNER to postgres;