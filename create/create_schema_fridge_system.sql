PGDMP  3                     |            postgres    11.22    16.0 7    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    13429    postgres    DATABASE     j   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE postgres;
                yusei-hashimoto    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   yusei-hashimoto    false    3303                        2615    16385    fridge_system    SCHEMA        CREATE SCHEMA fridge_system;
    DROP SCHEMA fridge_system;
                postgres    false            �            1259    16446    fridge_table    TABLE     y   CREATE TABLE fridge_system.fridge_table (
    fk_id_recipe integer,
    fk_id_ingredient integer,
    amount smallint
);
 '   DROP TABLE fridge_system.fridge_table;
       fridge_system            postgres    false    8            �            1259    16432    genre_table    TABLE     y   CREATE TABLE fridge_system.genre_table (
    id_genre integer NOT NULL,
    name_genre character varying(80) NOT NULL
);
 &   DROP TABLE fridge_system.genre_table;
       fridge_system            postgres    false    8            �            1259    16430    genre_table_id_genre_seq    SEQUENCE     �   CREATE SEQUENCE fridge_system.genre_table_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE fridge_system.genre_table_id_genre_seq;
       fridge_system          postgres    false    8    204            �           0    0    genre_table_id_genre_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE fridge_system.genre_table_id_genre_seq OWNED BY fridge_system.genre_table.id_genre;
          fridge_system          postgres    false    203            �            1259    16424    ingredient_table    TABLE     �   CREATE TABLE fridge_system.ingredient_table (
    id_ingredient integer NOT NULL,
    name_ingredient character varying(80),
    fk_id_unit integer NOT NULL,
    fk_id_genre integer NOT NULL
);
 +   DROP TABLE fridge_system.ingredient_table;
       fridge_system            postgres    false    8            �            1259    16422    id_ingredient_id_ingredient_seq    SEQUENCE     �   CREATE SEQUENCE fridge_system.id_ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE fridge_system.id_ingredient_id_ingredient_seq;
       fridge_system          postgres    false    202    8            �           0    0    id_ingredient_id_ingredient_seq    SEQUENCE OWNED BY     t   ALTER SEQUENCE fridge_system.id_ingredient_id_ingredient_seq OWNED BY fridge_system.ingredient_table.id_ingredient;
          fridge_system          postgres    false    201            �            1259    16482    recipe_ingredient_table    TABLE     �   CREATE TABLE fridge_system.recipe_ingredient_table (
    fk_id_recipe integer NOT NULL,
    fk_id_ingredient integer NOT NULL,
    amount smallint
);
 2   DROP TABLE fridge_system.recipe_ingredient_table;
       fridge_system            postgres    false    8            �            1259    16413    recipe_table    TABLE     �   CREATE TABLE fridge_system.recipe_table (
    id_recipe integer NOT NULL,
    name_recipe character varying(80) NOT NULL,
    "serving size" smallint,
    method character varying(2000)
);
 '   DROP TABLE fridge_system.recipe_table;
       fridge_system            postgres    false    8            �            1259    16411    recipe_table_id_recipe_seq    SEQUENCE     �   CREATE SEQUENCE fridge_system.recipe_table_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE fridge_system.recipe_table_id_recipe_seq;
       fridge_system          postgres    false    200    8            �           0    0    recipe_table_id_recipe_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE fridge_system.recipe_table_id_recipe_seq OWNED BY fridge_system.recipe_table.id_recipe;
          fridge_system          postgres    false    199            �            1259    16469    shopping_table    TABLE     �   CREATE TABLE fridge_system.shopping_table (
    fk_id_ingredient integer,
    fk_id_user integer,
    order_number smallint,
    purchased_flag boolean,
    createdate timestamp with time zone
);
 )   DROP TABLE fridge_system.shopping_table;
       fridge_system            postgres    false    8            �            1259    16440 
   unit_table    TABLE     u   CREATE TABLE fridge_system.unit_table (
    id_unit integer NOT NULL,
    name_unit character varying(5) NOT NULL
);
 %   DROP TABLE fridge_system.unit_table;
       fridge_system            postgres    false    8            �            1259    16438    unit_table_id_unit_seq    SEQUENCE     �   CREATE SEQUENCE fridge_system.unit_table_id_unit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE fridge_system.unit_table_id_unit_seq;
       fridge_system          postgres    false    206    8            �           0    0    unit_table_id_unit_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE fridge_system.unit_table_id_unit_seq OWNED BY fridge_system.unit_table.id_unit;
          fridge_system          postgres    false    205            �            1259    16388 
   user_table    TABLE     �   CREATE TABLE fridge_system.user_table (
    id_user integer NOT NULL,
    name_user character varying(20) NOT NULL,
    mail character varying(253) NOT NULL,
    password character varying NOT NULL,
    salt character varying NOT NULL
);
 %   DROP TABLE fridge_system.user_table;
       fridge_system            postgres    false    8            �            1259    16386    user_table_userid_seq    SEQUENCE     �   CREATE SEQUENCE fridge_system.user_table_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE fridge_system.user_table_userid_seq;
       fridge_system          postgres    false    8    198            �           0    0    user_table_userid_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE fridge_system.user_table_userid_seq OWNED BY fridge_system.user_table.id_user;
          fridge_system          postgres    false    197            H           2604    16435    genre_table id_genre    DEFAULT     �   ALTER TABLE ONLY fridge_system.genre_table ALTER COLUMN id_genre SET DEFAULT nextval('fridge_system.genre_table_id_genre_seq'::regclass);
 J   ALTER TABLE fridge_system.genre_table ALTER COLUMN id_genre DROP DEFAULT;
       fridge_system          postgres    false    204    203    204            G           2604    16427    ingredient_table id_ingredient    DEFAULT     �   ALTER TABLE ONLY fridge_system.ingredient_table ALTER COLUMN id_ingredient SET DEFAULT nextval('fridge_system.id_ingredient_id_ingredient_seq'::regclass);
 T   ALTER TABLE fridge_system.ingredient_table ALTER COLUMN id_ingredient DROP DEFAULT;
       fridge_system          postgres    false    202    201    202            F           2604    16416    recipe_table id_recipe    DEFAULT     �   ALTER TABLE ONLY fridge_system.recipe_table ALTER COLUMN id_recipe SET DEFAULT nextval('fridge_system.recipe_table_id_recipe_seq'::regclass);
 L   ALTER TABLE fridge_system.recipe_table ALTER COLUMN id_recipe DROP DEFAULT;
       fridge_system          postgres    false    199    200    200            I           2604    16443    unit_table id_unit    DEFAULT     �   ALTER TABLE ONLY fridge_system.unit_table ALTER COLUMN id_unit SET DEFAULT nextval('fridge_system.unit_table_id_unit_seq'::regclass);
 H   ALTER TABLE fridge_system.unit_table ALTER COLUMN id_unit DROP DEFAULT;
       fridge_system          postgres    false    206    205    206            E           2604    16391    user_table id_user    DEFAULT     �   ALTER TABLE ONLY fridge_system.user_table ALTER COLUMN id_user SET DEFAULT nextval('fridge_system.user_table_userid_seq'::regclass);
 H   ALTER TABLE fridge_system.user_table ALTER COLUMN id_user DROP DEFAULT;
       fridge_system          postgres    false    198    197    198            �          0    16446    fridge_table 
   TABLE DATA           U   COPY fridge_system.fridge_table (fk_id_recipe, fk_id_ingredient, amount) FROM stdin;
    fridge_system          postgres    false    207   �F       �          0    16432    genre_table 
   TABLE DATA           B   COPY fridge_system.genre_table (id_genre, name_genre) FROM stdin;
    fridge_system          postgres    false    204   G       �          0    16424    ingredient_table 
   TABLE DATA           j   COPY fridge_system.ingredient_table (id_ingredient, name_ingredient, fk_id_unit, fk_id_genre) FROM stdin;
    fridge_system          postgres    false    202   UG       �          0    16482    recipe_ingredient_table 
   TABLE DATA           `   COPY fridge_system.recipe_ingredient_table (fk_id_recipe, fk_id_ingredient, amount) FROM stdin;
    fridge_system          postgres    false    209   �G       �          0    16413    recipe_table 
   TABLE DATA           ]   COPY fridge_system.recipe_table (id_recipe, name_recipe, "serving size", method) FROM stdin;
    fridge_system          postgres    false    200   �G       �          0    16469    shopping_table 
   TABLE DATA           w   COPY fridge_system.shopping_table (fk_id_ingredient, fk_id_user, order_number, purchased_flag, createdate) FROM stdin;
    fridge_system          postgres    false    208   �G       �          0    16440 
   unit_table 
   TABLE DATA           ?   COPY fridge_system.unit_table (id_unit, name_unit) FROM stdin;
    fridge_system          postgres    false    206   �G       �          0    16388 
   user_table 
   TABLE DATA           U   COPY fridge_system.user_table (id_user, name_user, mail, password, salt) FROM stdin;
    fridge_system          postgres    false    198   ?H       �           0    0    genre_table_id_genre_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('fridge_system.genre_table_id_genre_seq', 5, true);
          fridge_system          postgres    false    203            �           0    0    id_ingredient_id_ingredient_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('fridge_system.id_ingredient_id_ingredient_seq', 2, true);
          fridge_system          postgres    false    201            �           0    0    recipe_table_id_recipe_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('fridge_system.recipe_table_id_recipe_seq', 1, false);
          fridge_system          postgres    false    199            �           0    0    unit_table_id_unit_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('fridge_system.unit_table_id_unit_seq', 8, true);
          fridge_system          postgres    false    205            �           0    0    user_table_userid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('fridge_system.user_table_userid_seq', 5, true);
          fridge_system          postgres    false    197            Q           2606    16437    genre_table genre_table_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY fridge_system.genre_table
    ADD CONSTRAINT genre_table_pkey PRIMARY KEY (id_genre);
 M   ALTER TABLE ONLY fridge_system.genre_table DROP CONSTRAINT genre_table_pkey;
       fridge_system            postgres    false    204            O           2606    16429 #   ingredient_table id_ingredient_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT id_ingredient_pkey PRIMARY KEY (id_ingredient);
 T   ALTER TABLE ONLY fridge_system.ingredient_table DROP CONSTRAINT id_ingredient_pkey;
       fridge_system            postgres    false    202            M           2606    16421    recipe_table recipe_table_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY fridge_system.recipe_table
    ADD CONSTRAINT recipe_table_pkey PRIMARY KEY (id_recipe);
 O   ALTER TABLE ONLY fridge_system.recipe_table DROP CONSTRAINT recipe_table_pkey;
       fridge_system            postgres    false    200            S           2606    16445    unit_table unit_table_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY fridge_system.unit_table
    ADD CONSTRAINT unit_table_pkey PRIMARY KEY (id_unit);
 K   ALTER TABLE ONLY fridge_system.unit_table DROP CONSTRAINT unit_table_pkey;
       fridge_system            postgres    false    206            K           2606    16396    user_table user_table_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY fridge_system.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (id_user);
 K   ALTER TABLE ONLY fridge_system.user_table DROP CONSTRAINT user_table_pkey;
       fridge_system            postgres    false    198            V           2606    16449 /   fridge_table fridge_table_fk_id_ingredient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.fridge_table
    ADD CONSTRAINT fridge_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);
 `   ALTER TABLE ONLY fridge_system.fridge_table DROP CONSTRAINT fridge_table_fk_id_ingredient_fkey;
       fridge_system          postgres    false    3151    207    202            W           2606    16454 +   fridge_table fridge_table_fk_id_recipe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.fridge_table
    ADD CONSTRAINT fridge_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe) REFERENCES fridge_system.recipe_table(id_recipe);
 \   ALTER TABLE ONLY fridge_system.fridge_table DROP CONSTRAINT fridge_table_fk_id_recipe_fkey;
       fridge_system          postgres    false    3149    200    207            T           2606    16464 2   ingredient_table ingredient_table_fk_id_genre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT ingredient_table_fk_id_genre_fkey FOREIGN KEY (fk_id_genre) REFERENCES fridge_system.genre_table(id_genre);
 c   ALTER TABLE ONLY fridge_system.ingredient_table DROP CONSTRAINT ingredient_table_fk_id_genre_fkey;
       fridge_system          postgres    false    3153    202    204            X           2606    16472 5   shopping_table ingredient_table_fk_id_ingredient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.shopping_table
    ADD CONSTRAINT ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);
 f   ALTER TABLE ONLY fridge_system.shopping_table DROP CONSTRAINT ingredient_table_fk_id_ingredient_fkey;
       fridge_system          postgres    false    202    3151    208            U           2606    16459 1   ingredient_table ingredient_table_fk_id_unit_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT ingredient_table_fk_id_unit_fkey FOREIGN KEY (fk_id_unit) REFERENCES fridge_system.unit_table(id_unit);
 b   ALTER TABLE ONLY fridge_system.ingredient_table DROP CONSTRAINT ingredient_table_fk_id_unit_fkey;
       fridge_system          postgres    false    202    3155    206            Y           2606    16477 /   shopping_table ingredient_table_fk_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.shopping_table
    ADD CONSTRAINT ingredient_table_fk_id_user_fkey FOREIGN KEY (fk_id_user) REFERENCES fridge_system.user_table(id_user);
 `   ALTER TABLE ONLY fridge_system.shopping_table DROP CONSTRAINT ingredient_table_fk_id_user_fkey;
       fridge_system          postgres    false    208    3147    198            Z           2606    16485 E   recipe_ingredient_table recipe_ingredient_table_fk_id_ingredient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.recipe_ingredient_table
    ADD CONSTRAINT recipe_ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);
 v   ALTER TABLE ONLY fridge_system.recipe_ingredient_table DROP CONSTRAINT recipe_ingredient_table_fk_id_ingredient_fkey;
       fridge_system          postgres    false    202    3151    209            [           2606    16490 A   recipe_ingredient_table recipe_ingredient_table_fk_id_recipe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fridge_system.recipe_ingredient_table
    ADD CONSTRAINT recipe_ingredient_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe) REFERENCES fridge_system.recipe_table(id_recipe);
 r   ALTER TABLE ONLY fridge_system.recipe_ingredient_table DROP CONSTRAINT recipe_ingredient_table_fk_id_recipe_fkey;
       fridge_system          postgres    false    3149    200    209            �      x������ � �      �   :   x�/ ��1	肉
2	魚
3	果物
4	野菜
5	お菓子
\.


���      �   1   x�3�|�8�qS��ƞǍ-���8�9M��8_l�����ӐӐ+F��� ���      �      x������ � �      �      x������ � �      �      x������ � �      �   B   x�3�L�2�|�d��Ʃ�gps>m��2�|ֱ�˔39�ˌ��~��9H���e�ʗ��\1z\\\ S�Y      �   ~   x����0���0��ϓ|� �(�5C�or @��^�򽤆[�pGTY�I̢�'Y%o�ٷ��C�̈́�'��Z�'�@
Q�3@053�1eK=�:��6p�j:�P�Ԑ� �;�u1�vζ>��?Z�*�     