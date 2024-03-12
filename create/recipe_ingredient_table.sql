-- Table: fridge-system.recipe_ingredient_table

-- DROP TABLE IF EXISTS "fridge-system".recipe_ingredient_table;

CREATE TABLE IF NOT EXISTS "fridge-system".recipe_ingredient_table
(
    fk_id_recipe integer NOT NULL,
    fk_id_ingredient integer NOT NULL,
    amount smallint,
    CONSTRAINT recipe_ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient)
        REFERENCES "fridge-system".ingredient_table (id_ingredient) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT recipe_ingredient_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe)
        REFERENCES "fridge-system".recipe_table (id_recipe) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "fridge-system".recipe_ingredient_table
    OWNER to postgres;