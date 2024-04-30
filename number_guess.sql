--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 23, 9);
INSERT INTO public.games VALUES (2, 23, 12);
INSERT INTO public.games VALUES (3, 26, 830);
INSERT INTO public.games VALUES (4, 26, 338);
INSERT INTO public.games VALUES (5, 27, 707);
INSERT INTO public.games VALUES (6, 27, 723);
INSERT INTO public.games VALUES (7, 26, 899);
INSERT INTO public.games VALUES (8, 26, 443);
INSERT INTO public.games VALUES (9, 26, 704);
INSERT INTO public.games VALUES (10, 28, 102);
INSERT INTO public.games VALUES (11, 28, 681);
INSERT INTO public.games VALUES (12, 29, 239);
INSERT INTO public.games VALUES (13, 29, 221);
INSERT INTO public.games VALUES (14, 28, 979);
INSERT INTO public.games VALUES (15, 28, 339);
INSERT INTO public.games VALUES (16, 28, 382);
INSERT INTO public.games VALUES (17, 30, 920);
INSERT INTO public.games VALUES (18, 30, 435);
INSERT INTO public.games VALUES (19, 31, 927);
INSERT INTO public.games VALUES (20, 31, 748);
INSERT INTO public.games VALUES (21, 30, 562);
INSERT INTO public.games VALUES (22, 30, 851);
INSERT INTO public.games VALUES (23, 30, 41);
INSERT INTO public.games VALUES (24, 32, 9);
INSERT INTO public.games VALUES (25, 32, 6);
INSERT INTO public.games VALUES (26, 33, 655);
INSERT INTO public.games VALUES (27, 33, 196);
INSERT INTO public.games VALUES (28, 34, 395);
INSERT INTO public.games VALUES (29, 34, 660);
INSERT INTO public.games VALUES (30, 33, 986);
INSERT INTO public.games VALUES (31, 33, 463);
INSERT INTO public.games VALUES (32, 33, 706);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (23, 'nevensen');
INSERT INTO public.users VALUES (25, 'nevensen310');
INSERT INTO public.users VALUES (26, 'user_1714447092489');
INSERT INTO public.users VALUES (27, 'user_1714447092488');
INSERT INTO public.users VALUES (28, 'user_1714447123199');
INSERT INTO public.users VALUES (29, 'user_1714447123198');
INSERT INTO public.users VALUES (30, 'user_1714447161828');
INSERT INTO public.users VALUES (31, 'user_1714447161827');
INSERT INTO public.users VALUES (32, 'nate');
INSERT INTO public.users VALUES (33, 'user_1714447266112');
INSERT INTO public.users VALUES (34, 'user_1714447266111');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 34, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
