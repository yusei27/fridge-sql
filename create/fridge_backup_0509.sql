-.-
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 14.2

-- Started on 2024-05-09 18:44:44 JST

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
-- TOC entry 6 (class 2615 OID 16407)
-- Name: fridge_system; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA fridge_system;


ALTER SCHEMA fridge_system OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16408)
-- Name: fridge_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.fridge_table (
    fk_id_recipe integer,
    fk_id_ingredient integer,
    amount smallint
);


ALTER TABLE fridge_system.fridge_table OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16411)
-- Name: genre_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.genre_table (
    id_genre integer NOT NULL,
    name_genre character varying(80) NOT NULL
);


ALTER TABLE fridge_system.genre_table OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16414)
-- Name: genre_table_id_genre_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.genre_table_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fridge_system.genre_table_id_genre_seq OWNER TO postgres;

--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 212
-- Name: genre_table_id_genre_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.genre_table_id_genre_seq OWNED BY fridge_system.genre_table.id_genre;


--
-- TOC entry 213 (class 1259 OID 16415)
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
-- TOC entry 214 (class 1259 OID 16418)
-- Name: id_ingredient_id_ingredient_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.id_ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fridge_system.id_ingredient_id_ingredient_seq OWNER TO postgres;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 214
-- Name: id_ingredient_id_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.id_ingredient_id_ingredient_seq OWNED BY fridge_system.ingredient_table.id_ingredient;


--
-- TOC entry 215 (class 1259 OID 16419)
-- Name: recipe_ingredient_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.recipe_ingredient_table (
    fk_id_recipe integer NOT NULL,
    fk_id_ingredient integer NOT NULL,
    amount smallint
);


ALTER TABLE fridge_system.recipe_ingredient_table OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16422)
-- Name: recipe_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.recipe_table (
    id_recipe integer NOT NULL,
    name_recipe character varying(80) NOT NULL,
    serving_size smallint,
    method character varying(2000)
);


ALTER TABLE fridge_system.recipe_table OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16427)
-- Name: recipe_table_id_recipe_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.recipe_table_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fridge_system.recipe_table_id_recipe_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 217
-- Name: recipe_table_id_recipe_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.recipe_table_id_recipe_seq OWNED BY fridge_system.recipe_table.id_recipe;


--
-- TOC entry 218 (class 1259 OID 16428)
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
-- TOC entry 219 (class 1259 OID 16431)
-- Name: unit_table; Type: TABLE; Schema: fridge_system; Owner: postgres
--

CREATE TABLE fridge_system.unit_table (
    id_unit integer NOT NULL,
    name_unit character varying(5) NOT NULL
);


ALTER TABLE fridge_system.unit_table OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16434)
-- Name: unit_table_id_unit_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.unit_table_id_unit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fridge_system.unit_table_id_unit_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 220
-- Name: unit_table_id_unit_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.unit_table_id_unit_seq OWNED BY fridge_system.unit_table.id_unit;


--
-- TOC entry 221 (class 1259 OID 16435)
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
-- TOC entry 222 (class 1259 OID 16440)
-- Name: user_table_userid_seq; Type: SEQUENCE; Schema: fridge_system; Owner: postgres
--

CREATE SEQUENCE fridge_system.user_table_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fridge_system.user_table_userid_seq OWNER TO postgres;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_table_userid_seq; Type: SEQUENCE OWNED BY; Schema: fridge_system; Owner: postgres
--

ALTER SEQUENCE fridge_system.user_table_userid_seq OWNED BY fridge_system.user_table.id_user;


--
-- TOC entry 3485 (class 2604 OID 16441)
-- Name: genre_table id_genre; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.genre_table ALTER COLUMN id_genre SET DEFAULT nextval('fridge_system.genre_table_id_genre_seq'::regclass);


--
-- TOC entry 3486 (class 2604 OID 16442)
-- Name: ingredient_table id_ingredient; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table ALTER COLUMN id_ingredient SET DEFAULT nextval('fridge_system.id_ingredient_id_ingredient_seq'::regclass);


--
-- TOC entry 3487 (class 2604 OID 16443)
-- Name: recipe_table id_recipe; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_table ALTER COLUMN id_recipe SET DEFAULT nextval('fridge_system.recipe_table_id_recipe_seq'::regclass);


--
-- TOC entry 3488 (class 2604 OID 16444)
-- Name: unit_table id_unit; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.unit_table ALTER COLUMN id_unit SET DEFAULT nextval('fridge_system.unit_table_id_unit_seq'::regclass);


--
-- TOC entry 3489 (class 2604 OID 16445)
-- Name: user_table id_user; Type: DEFAULT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.user_table ALTER COLUMN id_user SET DEFAULT nextval('fridge_system.user_table_userid_seq'::regclass);


--
-- TOC entry 3647 (class 0 OID 16408)
-- Dependencies: 210
-- Data for Name: fridge_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.fridge_table (fk_id_recipe, fk_id_ingredient, amount) FROM stdin;
\.


--
-- TOC entry 3648 (class 0 OID 16411)
-- Dependencies: 211
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
-- TOC entry 3650 (class 0 OID 16415)
-- Dependencies: 213
-- Data for Name: ingredient_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.ingredient_table (id_ingredient, name_ingredient, fk_id_unit, fk_id_genre) FROM stdin;
1	じゃがいも	3	4
2	豚肉	1	1
6	焼きそば麺	3	5
7	ソース	2	3
8	カット野菜	3	4
9	豚ロース	3	1
10	塩胡椒	6	5
11	サラダ油	2	5
\.


--
-- TOC entry 3652 (class 0 OID 16419)
-- Dependencies: 215
-- Data for Name: recipe_ingredient_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.recipe_ingredient_table (fk_id_recipe, fk_id_ingredient, amount) FROM stdin;
2	6	1
2	7	3
2	8	1
3	9	2
3	10	2
3	11	1
\.


--
-- TOC entry 3653 (class 0 OID 16422)
-- Dependencies: 216
-- Data for Name: recipe_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.recipe_table (id_recipe, name_recipe, serving_size, method) FROM stdin;
2	焼きそば	1	1.麺に水をかけて炒める\n2.野菜を追加して炒める\n3.ソースを追加して炒める
3	ポークステーキ	2	1.豚ロースをサラダ油で焦げ目がつくまで焼く\n2.塩こしょうをかける
\.


--
-- TOC entry 3655 (class 0 OID 16428)
-- Dependencies: 218
-- Data for Name: shopping_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.shopping_table (fk_id_ingredient, fk_id_user, order_number, purchased_flag, createdate) FROM stdin;
\.


--
-- TOC entry 3656 (class 0 OID 16431)
-- Dependencies: 219
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
-- TOC entry 3658 (class 0 OID 16435)
-- Dependencies: 221
-- Data for Name: user_table; Type: TABLE DATA; Schema: fridge_system; Owner: postgres
--

COPY fridge_system.user_table (id_user, name_user, mail, password, salt) FROM stdin;
5	aaa	aaa@	4f18702a886aff7a73d91d23345ac927fd3c7d90c5893e2a6c326f0ed4eef663	\\x426a6d422f4836626757774b6941434f7743596d6c716b657757514e2f795a4662666e68303270476541383d
6	 シェフ橋本	syutard@yahoo.co.jp	b7ca298e14141cfa894a85dbb5aec7fdf11c363c6badb56b45a43929c19afc8f	\\x6b793679636d4b796c685279665a684f73386165326f386f63313678556a384376642f775a6f49347271493d
7	テスト１	test@yahoo.co.jp	4bbffc2ae61bfdc88f25cbf6532964bc331b6cf6bb8b8dac70dfefa4f0526ff9	j3Bd8H5XiA36UcS3AVrATg69O4dos/XLjLPsDylgsk0=
\.


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 212
-- Name: genre_table_id_genre_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.genre_table_id_genre_seq', 5, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 214
-- Name: id_ingredient_id_ingredient_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.id_ingredient_id_ingredient_seq', 11, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 217
-- Name: recipe_table_id_recipe_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.recipe_table_id_recipe_seq', 3, true);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 220
-- Name: unit_table_id_unit_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.unit_table_id_unit_seq', 8, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_table_userid_seq; Type: SEQUENCE SET; Schema: fridge_system; Owner: postgres
--

SELECT pg_catalog.setval('fridge_system.user_table_userid_seq', 10, true);


--
-- TOC entry 3491 (class 2606 OID 16447)
-- Name: genre_table genre_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.genre_table
    ADD CONSTRAINT genre_table_pkey PRIMARY KEY (id_genre);


--
-- TOC entry 3493 (class 2606 OID 16449)
-- Name: ingredient_table id_ingredient_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT id_ingredient_pkey PRIMARY KEY (id_ingredient);


--
-- TOC entry 3495 (class 2606 OID 16451)
-- Name: recipe_table recipe_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_table
    ADD CONSTRAINT recipe_table_pkey PRIMARY KEY (id_recipe);


--
-- TOC entry 3497 (class 2606 OID 16453)
-- Name: unit_table unit_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.unit_table
    ADD CONSTRAINT unit_table_pkey PRIMARY KEY (id_unit);


--
-- TOC entry 3499 (class 2606 OID 16455)
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3500 (class 2606 OID 16456)
-- Name: fridge_table fridge_table_fk_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.fridge_table
    ADD CONSTRAINT fridge_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);


--
-- TOC entry 3501 (class 2606 OID 16461)
-- Name: fridge_table fridge_table_fk_id_recipe_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.fridge_table
    ADD CONSTRAINT fridge_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe) REFERENCES fridge_system.recipe_table(id_recipe);


--
-- TOC entry 3502 (class 2606 OID 16466)
-- Name: ingredient_table ingredient_table_fk_id_genre_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT ingredient_table_fk_id_genre_fkey FOREIGN KEY (fk_id_genre) REFERENCES fridge_system.genre_table(id_genre);


--
-- TOC entry 3506 (class 2606 OID 16471)
-- Name: shopping_table ingredient_table_fk_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.shopping_table
    ADD CONSTRAINT ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);


--
-- TOC entry 3503 (class 2606 OID 16476)
-- Name: ingredient_table ingredient_table_fk_id_unit_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.ingredient_table
    ADD CONSTRAINT ingredient_table_fk_id_unit_fkey FOREIGN KEY (fk_id_unit) REFERENCES fridge_system.unit_table(id_unit);


--
-- TOC entry 3507 (class 2606 OID 16481)
-- Name: shopping_table ingredient_table_fk_id_user_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.shopping_table
    ADD CONSTRAINT ingredient_table_fk_id_user_fkey FOREIGN KEY (fk_id_user) REFERENCES fridge_system.user_table(id_user);


--
-- TOC entry 3504 (class 2606 OID 16486)
-- Name: recipe_ingredient_table recipe_ingredient_table_fk_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_ingredient_table
    ADD CONSTRAINT recipe_ingredient_table_fk_id_ingredient_fkey FOREIGN KEY (fk_id_ingredient) REFERENCES fridge_system.ingredient_table(id_ingredient);


--
-- TOC entry 3505 (class 2606 OID 16491)
-- Name: recipe_ingredient_table recipe_ingredient_table_fk_id_recipe_fkey; Type: FK CONSTRAINT; Schema: fridge_system; Owner: postgres
--

ALTER TABLE ONLY fridge_system.recipe_ingredient_table
    ADD CONSTRAINT recipe_ingredient_table_fk_id_recipe_fkey FOREIGN KEY (fk_id_recipe) REFERENCES fridge_system.recipe_table(id_recipe);


-- Completed on 2024-05-09 18:44:45 JST

--
-- PostgreSQL database dump complete
--

