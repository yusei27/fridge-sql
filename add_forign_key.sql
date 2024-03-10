ALTER TABLE "fridge-system".ingredient_table
ADD COLUMN fk_id_genre integer NOT NULL
;
ALTER TABLE "fridge-system".ingredient_table
ADD CONSTRAINT ingredient_table_fk_id_genre_fkey
FOREIGN KEY (fk_id_genre) REFERENCES "fridge-system".genre_table(id_genre);