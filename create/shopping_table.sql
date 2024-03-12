-- Table: fridge-system.shopping_table

-- DROP TABLE IF EXISTS "fridge-system".shopping_table;

CREATE TABLE IF NOT EXISTS "fridge-system".shopping_table
(
    fk_id_ingredient integer,
    fk_id_user integer,
    order_number smallint,
    purchased_flag boolean,
    createdate timestamp with time zone,
    CONSTRAINT ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient)
        REFERENCES "fridge-system".ingredient_table (id_ingredient) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ingredient_table_fk_id_user_fkey FOREIGN KEY (fk_id_user)
        REFERENCES "fridge-system".user_table (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".shopping_table
    OWNER to postgres;