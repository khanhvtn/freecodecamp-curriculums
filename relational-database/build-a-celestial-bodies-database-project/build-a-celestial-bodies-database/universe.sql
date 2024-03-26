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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types text,
    galaxy_types text,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types text,
    galaxy_types text,
    distance_from_earth integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types text,
    galaxy_types text,
    distance_from_earth integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types text,
    galaxy_types text,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.test (
    test_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types text,
    galaxy_types text,
    distance_from_earth integer
);


ALTER TABLE public.test OWNER TO freecodecamp;

--
-- Name: test_test_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.test_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_test_id_seq OWNER TO freecodecamp;

--
-- Name: test_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.test_test_id_seq OWNED BY public.test.test_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: test test_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test ALTER COLUMN test_id SET DEFAULT nextval('public.test_test_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda Galaxy Description', 100, true, 10, 'SA', 'SA', 10000);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Antennae Galaxies Description', 200, false, 20, 'BA', 'BA', 20000);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'Backward Galaxy Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', 'Galaxy 4 Description', 100, true, 10, 'SA', 'SA', 10000);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', 'Galaxy 5 Description', 200, false, 20, 'BA', 'BA', 20000);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', 'Galaxy 6 Description', 300, true, 30, 'CA', 'CA', 30000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon 1', 'Moon 1 Description', 100, true, 1, 'SA', 'SA', 10000);
INSERT INTO public.moon VALUES (2, 2, 'Moon 2', 'Moon 2 Description', 100, true, 2, 'SA', 'SA', 20000);
INSERT INTO public.moon VALUES (3, 3, 'Moon 3', 'Moon 3 Description', 100, true, 3, 'SA', 'SA', 30000);
INSERT INTO public.moon VALUES (4, 4, 'Moon 4', 'Moon 4 Description', 100, true, 4, 'SA', 'SA', 40000);
INSERT INTO public.moon VALUES (5, 5, 'Moon 5', 'Moon 5 Description', 100, true, 5, 'SA', 'SA', 50000);
INSERT INTO public.moon VALUES (6, 6, 'Moon 6', 'Moon 6 Description', 100, true, 6, 'SA', 'SA', 60000);
INSERT INTO public.moon VALUES (7, 7, 'Moon 7', 'Moon 7 Description', 100, true, 7, 'SA', 'SA', 70000);
INSERT INTO public.moon VALUES (8, 8, 'Moon 8', 'Moon 8 Description', 100, true, 8, 'SA', 'SA', 80000);
INSERT INTO public.moon VALUES (9, 9, 'Moon 9', 'Moon 9 Description', 100, true, 9, 'SA', 'SA', 90000);
INSERT INTO public.moon VALUES (10, 10, 'Moon 10', 'Moon 10 Description', 100, true, 10, 'SA', 'SA', 100000);
INSERT INTO public.moon VALUES (11, 11, 'Moon 11', 'Moon 11 Description', 100, true, 11, 'SA', 'SA', 110000);
INSERT INTO public.moon VALUES (12, 12, 'Moon 12', 'Moon 12 Description', 100, true, 12, 'SA', 'SA', 120000);
INSERT INTO public.moon VALUES (13, 1, 'Moon 13', 'Moon 13 Description', 100, true, 1, 'SA', 'SA', 10000);
INSERT INTO public.moon VALUES (14, 2, 'Moon 14', 'Moon 14 Description', 100, true, 2, 'SA', 'SA', 20000);
INSERT INTO public.moon VALUES (15, 3, 'Moon 15', 'Moon 15 Description', 100, true, 3, 'SA', 'SA', 30000);
INSERT INTO public.moon VALUES (16, 4, 'Moon 16', 'Moon 16 Description', 100, true, 4, 'SA', 'SA', 40000);
INSERT INTO public.moon VALUES (17, 5, 'Moon 17', 'Moon 17 Description', 100, true, 5, 'SA', 'SA', 50000);
INSERT INTO public.moon VALUES (18, 6, 'Moon 18', 'Moon 18 Description', 100, true, 6, 'SA', 'SA', 60000);
INSERT INTO public.moon VALUES (19, 7, 'Moon 19', 'Moon 19 Description', 100, true, 7, 'SA', 'SA', 70000);
INSERT INTO public.moon VALUES (20, 8, 'Moon 20', 'Moon 20 Description', 100, true, 8, 'SA', 'SA', 80000);
INSERT INTO public.moon VALUES (21, 9, 'Moon 21', 'Moon 21 Description', 100, true, 9, 'SA', 'SA', 90000);
INSERT INTO public.moon VALUES (23, 11, 'Moon 23', 'Moon 23 Description', 100, true, 11, 'SA', 'SA', 110000);
INSERT INTO public.moon VALUES (24, 12, 'Moon 24', 'Moon 24 Description', 100, true, 12, 'SA', 'SA', 120000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Planet 1', 'Planet 1 Description', 100, true, 10, 'SA', 'SA', 10000);
INSERT INTO public.planet VALUES (2, 2, 'Planet 2', 'Planet 2 Description', 200, false, 20, 'BA', 'BA', 20000);
INSERT INTO public.planet VALUES (3, 3, 'Planet 3', 'Planet 3 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (4, 4, 'Planet 4', 'Planet 4 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (5, 5, 'Planet 5', 'Planet 5 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (6, 6, 'Planet 6', 'Planet 6 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (7, 4, 'Planet 7', 'Planet 7 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (8, 5, 'Planet 8', 'Planet 8 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (9, 6, 'Planet 9', 'Planet 9 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (10, 4, 'Planet 10', 'Planet 10 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (11, 5, 'Planet 11', 'Planet 11 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.planet VALUES (12, 6, 'Planet 12', 'Planet 12 Description', 300, true, 30, 'CA', 'CA', 30000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Star 1', 'Star 1 Description', 100, true, 10, 'SA', 'SA', 10000);
INSERT INTO public.star VALUES (2, 2, 'Star 2', 'Star 2 Description', 200, false, 20, 'BA', 'BA', 20000);
INSERT INTO public.star VALUES (3, 3, 'Star 3', 'Star 3 Description', 300, true, 30, 'CA', 'CA', 30000);
INSERT INTO public.star VALUES (4, 4, 'Star 4', 'Star 4 Description', 100, true, 10, 'SA', 'SA', 10000);
INSERT INTO public.star VALUES (5, 5, 'Star 5', 'Star 5 Description', 200, false, 20, 'BA', 'BA', 20000);
INSERT INTO public.star VALUES (6, 6, 'Star 6', 'Star 6 Description', 300, true, 30, 'CA', 'CA', 30000);


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.test VALUES (1, 1, 'Test 1', 'Test 1 Description', 100, true, 1, 'SA', 'SA', 10000);
INSERT INTO public.test VALUES (2, 2, 'Test 2', 'Test 2 Description', 100, true, 2, 'SA', 'SA', 20000);
INSERT INTO public.test VALUES (3, 3, 'Test 3', 'Test 3 Description', 100, true, 3, 'SA', 'SA', 30000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: test_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.test_test_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: test test_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_name_key UNIQUE (name);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (test_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: test fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

