--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22
-- Dumped by pg_dump version 16.0

-- Started on 2024-03-19 00:40:55 JST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16385)
-- Name: fridge_system; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA fridge_system;


ALTER SCHEMA fridge_system OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 207 (class 1259 OID 16446)
-- Name: fridge_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.fridge_table (
    fk_id_recipe integer,
    fk_id_ingredient integer,
    amount smallint
);


ALTER TABLE fridge_system.fridge_table OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16432)
-- Name: genre_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.genre_table (
    id_genre integer NOT NULL,
    name_genre character varying(80) NOT NULL
);


ALTER TABLE fridge_system.genre_table OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16430)
-- Name: genre_table_id_genre_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.genre_table_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE fridge_system.genre_table_id_genre_seq OWNER TO postgres;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 203
-- Name: genre_table_id_genre_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.genre_table_id_genre_seq OWNED BY fridge_system.genre_table.id_genre;


--
-- TOC entry 202 (class 1259 OID 16424)
-- Name: ingredient_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.ingredient_table (
    id_ingredient integer NOT NULL,
    name_ingredient character varying(80),
    fk_id_unit integer NOT NULL,
    fk_id_genre integer NOT NULL
);


ALTER TABLE fridge_system.ingredient_table OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16422)
-- Name: id_ingredient_id_ingredient_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.id_ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE fridge_system.id_ingredient_id_ingredient_seq OWNER TO postgres;

--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 201
-- Name: id_ingredient_id_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.id_ingredient_id_ingredient_seq OWNED BY fridge_system.ingredient_table.id_ingredient;


--
-- TOC entry 209 (class 1259 OID 16482)
-- Name: recipe_ingredient_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.recipe_ingredient_table (
    fk_id_recipe integer NOT NULL,
    fk_id_ingredient integer NOT NULL,
    amount smallint
);


ALTER TABLE fridge_system.recipe_ingredient_table OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16413)
-- Name: recipe_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.recipe_table (
    id_recipe integer NOT NULL,
    name_recipe character varying(80) NOT NULL,
    "serving size" smallint,
    method character varying(2000)
);


ALTER TABLE fridge_system.recipe_table OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16411)
-- Name: recipe_table_id_recipe_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.recipe_table_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE fridge_system.recipe_table_id_recipe_seq OWNER TO postgres;

--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 199
-- Name: recipe_table_id_recipe_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.recipe_table_id_recipe_seq OWNED BY fridge_system.recipe_table.id_recipe;


--
-- TOC entry 208 (class 1259 OID 16469)
-- Name: shopping_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.shopping_table (
    fk_id_ingredient integer,
    fk_id_user integer,
    order_number smallint,
    purchased_flag boolean,
    createdate timestamp with time zone
);


ALTER TABLE fridge_system.shopping_table OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16440)
-- Name: unit_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.unit_table (
    id_unit integer NOT NULL,
    name_unit character varying(5) NOT NULL
);


ALTER TABLE fridge_system.unit_table OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16438)
-- Name: unit_table_id_unit_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.unit_table_id_unit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE fridge_system.unit_table_id_unit_seq OWNER TO postgres;

--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 205
-- Name: unit_table_id_unit_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.unit_table_id_unit_seq OWNED BY fridge_system.unit_table.id_unit;


--
-- TOC entry 198 (class 1259 OID 16388)
-- Name: user_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.user_table (
    id_user integer NOT NULL,
    name_user character varying(20) NOT NULL,
    mail character varying(253) NOT NULL,
    password character varying NOT NULL,
    salt character varying NOT NULL
);


ALTER TABLE fridge_system.user_table OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16386)
-- Name: user_table_userid_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.user_table_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE fridge_system.user_table_userid_seq OWNER TO postgres;

--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_table_userid_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.user_table_userid_seq OWNED BY fridge_system.user_table.id_user;


--
-- TOC entry 3144 (class 2604 OID 16435)
-- Name: genre_table id_genre; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.genre_table ALTER COLUMN id_genre SET DEFAULT nextval('fridge_system.genre_table_id_genre_seq'::regclass);


--
-- TOC entry 3143 (class 2604 OID 16427)
-- Name: ingredient_table id_ingredient; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table ALTER COLUMN id_ingredient SET DEFAULT nextval('fridge_system.id_ingredient_id_ingredient_seq'::regclass);


--
-- TOC entry 3142 (class 2604 OID 16416)
-- Name: recipe_table id_recipe; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_table ALTER COLUMN id_recipe SET DEFAULT nextval('fridge_system.recipe_table_id_recipe_seq'::regclass);


--
-- TOC entry 3145 (class 2604 OID 16443)
-- Name: unit_table id_unit; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.unit_table ALTER COLUMN id_unit SET DEFAULT nextval('fridge_system.unit_table_id_unit_seq'::regclass);


--
-- TOC entry 3141 (class 2604 OID 16391)
-- Name: user_table id_user; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.user_table ALTER COLUMN id_user SET DEFAULT nextval('fridge_system.user_table_userid_seq'::regclass);


--
-- TOC entry 3295 (class 0 OID 16446)
-- Dependencies: 207
-- Data for Name: fridge_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.fridge_table (fk_id_recipe, fk_id_ingredient, amount) FROM stdin;
\.


--
-- TOC entry 3292 (class 0 OID 16432)
-- Dependencies: 204
-- Data for Name: genre_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.genre_table (id_genre, name_genre) FROM stdin;
1	肉
2	魚
3	果物
4	野菜
5	お菓子
\.


--
-- TOC entry 3290 (class 0 OID 16424)
-- Dependencies: 202
-- Data for Name: ingredient_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.ingredient_table (id_ingredient, name_ingredient, fk_id_unit, fk_id_genre) FROM stdin;
1	じゃがいも	3	4
2	豚肉	1	1
\.


--
-- TOC entry 3297 (class 0 OID 16482)
-- Dependencies: 209
-- Data for Name: recipe_ingredient_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.recipe_ingredient_table (fk_id_recipe, fk_id_ingredient, amount) FROM stdin;
\.


--
-- TOC entry 3288 (class 0 OID 16413)
-- Dependencies: 200
-- Data for Name: recipe_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.recipe_table (id_recipe, name_recipe, "serving size", method) FROM stdin;
\.


--
-- TOC entry 3296 (class 0 OID 16469)
-- Dependencies: 208
-- Data for Name: shopping_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.shopping_table (fk_id_ingredient, fk_id_user, order_number, purchased_flag, createdate) FROM stdin;
\.


--
-- TOC entry 3294 (class 0 OID 16440)
-- Dependencies: 206
-- Data for Name: unit_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.unit_table (id_unit, name_unit) FROM stdin;
1	g
2	大さじ
3	個
4	房
5	cm
6	小さじ
7	cm
8	適量
\.


--
-- TOC entry 3286 (class 0 OID 16388)
-- Dependencies: 198
-- Data for Name: user_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.user_table (id_user, name_user, mail, password, salt) FROM stdin;
5	aaa	aaa@	4f18702a886aff7a73d91d23345ac927fd3c7d90c5893e2a6c326f0ed4eef663	\\x426a6d422f4836626757774b6941434f7743596d6c716b657757514e2f795a4662666e68303270476541383d
\.


--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 203
-- Name: genre_table_id_genre_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.genre_table_id_genre_seq', 5, true);


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 201
-- Name: id_ingredient_id_ingredient_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.id_ingredient_id_ingredient_seq', 2, true);


--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 199
-- Name: recipe_table_id_recipe_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.recipe_table_id_recipe_seq', 1, false);


--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 205
-- Name: unit_table_id_unit_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.unit_table_id_unit_seq', 8, true);


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_table_userid_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.user_table_userid_seq', 5, true);


--
-- TOC entry 3153 (class 2606 OID 16437)
-- Name: genre_table genre_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.genre_table
    ADD CONSTRAINT genre_table_pkey PRIMARY KEY (id_genre);


--
-- TOC entry 3151 (class 2606 OID 16429)
-- Name: ingredient_table id_ingredient_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT id_ingredient_pkey PRIMARY KEY (id_ingredient);


--
-- TOC entry 3149 (class 2606 OID 16421)
-- Name: recipe_table recipe_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_table
    ADD CONSTRAINT recipe_table_pkey PRIMARY KEY (id_recipe);


--
-- TOC entry 3155 (class 2606 OID 16445)
-- Name: unit_table unit_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.unit_table
    ADD CONSTRAINT unit_table_pkey PRIMARY KEY (id_unit);


--
-- TOC entry 3147 (class 2606 OID 16396)
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3158 (class 2606 OID 16449)
-- Name: fridge_table fridge_table_fk_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.fridge_table
    ADD CONSTRAINT fridge_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);


--
-- TOC entry 3159 (class 2606 OID 16454)
-- Name: fridge_table fridge_table_fk_id_recipe_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.fridge_table
    ADD CONSTRAINT fridge_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe) REFERENCES fridge_system.recipe_table(id_recipe);


--
-- TOC entry 3156 (class 2606 OID 16464)
-- Name: ingredient_table ingredient_table_fk_id_genre_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT ingredient_table_fk_id_genre_fkey FOREIGN KEY (fk_id_genre) REFERENCES fridge_system.genre_table(id_genre);


--
-- TOC entry 3160 (class 2606 OID 16472)
-- Name: shopping_table ingredient_table_fk_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.shopping_table
    ADD CONSTRAINT ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);


--
-- TOC entry 3157 (class 2606 OID 16459)
-- Name: ingredient_table ingredient_table_fk_id_unit_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT ingredient_table_fk_id_unit_fkey FOREIGN KEY (fk_id_unit) REFERENCES fridge_system.unit_table(id_unit);


--
-- TOC entry 3161 (class 2606 OID 16477)
-- Name: shopping_table ingredient_table_fk_id_user_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.shopping_table
    ADD CONSTRAINT ingredient_table_fk_id_user_fkey FOREIGN KEY (fk_id_user) REFERENCES fridge_system.user_table(id_user);


--
-- TOC entry 3162 (class 2606 OID 16485)
-- Name: recipe_ingredient_table recipe_ingredient_table_fk_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_ingredient_table
    ADD CONSTRAINT recipe_ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);


--
-- TOC entry 3163 (class 2606 OID 16490)
-- Name: recipe_ingredient_table recipe_ingredient_table_fk_id_recipe_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_ingredient_table
    ADD CONSTRAINT recipe_ingredient_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe) REFERENCES fridge_system.recipe_table(id_recipe);


-- Completed on 2024-03-19 00:40:55 JST

--
-- PostgreSQL database dump complete
--

