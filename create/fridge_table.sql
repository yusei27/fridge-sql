-- Table: fridge-system.fridge_table

-- DROP TABLE IF EXISTS "fridge-system".fridge_table;

CREATE TABLE IF NOT EXISTS "fridge-system".fridge_table
(
    fk_id_recipe integer,
    fk_id_ingredient integer,
    amount smallint,
    CONSTRAINT fridge_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient)
        REFERENCES "fridge-system".ingredient_table (id_ingredient) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fridge_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe)
        REFERENCES "fridge-system".recipe_table (id_recipe) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".fridge_table
    OWNER to postgres;