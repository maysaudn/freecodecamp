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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    no_of_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(20),
    is_active boolean,
    CONSTRAINT galaxy_galaxy_type_check CHECK (((galaxy_type)::text = ANY ((ARRAY['spiral'::character varying, 'elliptical'::character varying, 'lenticular'::character varying, 'irregular'::character varying, 'active'::character varying, 'seyfert'::character varying, 'quasar'::character varying, 'blazar'::character varying])::text[])))
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
    name character varying(20) NOT NULL,
    diameter_in_miles integer,
    rotates boolean,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    has_life boolean DEFAULT false,
    lightyears_from_earth integer,
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    age_in_billions_of_years numeric(6,3),
    galaxy_id integer NOT NULL,
    lightyears_from_sun integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Gemini', 85);
INSERT INTO public.constellation VALUES (2, 'Taurus', 19);
INSERT INTO public.constellation VALUES (3, 'Big Dipper', 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now.', 'spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 'spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Backward', NULL, 'spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', NULL, 'spiral', true);
INSERT INTO public.galaxy VALUES (5, 'Peekaboo', NULL, 'irregular', false);
INSERT INTO public.galaxy VALUES (6, 'Lindsay-Shapely Ring', NULL, 'lenticular', true);
INSERT INTO public.galaxy VALUES (7, 'Delphinus', NULL, 'spiral', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Damos', NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, NULL, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, 'lo', NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Kalichore', NULL, NULL, 3);
INSERT INTO public.moon VALUES (9, 'Amalthae', NULL, NULL, 3);
INSERT INTO public.moon VALUES (10, 'Euporie', NULL, NULL, 3);
INSERT INTO public.moon VALUES (11, 'Triton', NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Hippocamp', NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Proteus', NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Galatea', NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Titania', NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Ariel', NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Titon', NULL, NULL, 4);
INSERT INTO public.moon VALUES (18, 'Lapetus', NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, 'Hyperion', NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'Mimas', NULL, NULL, 4);
INSERT INTO public.moon VALUES (21, 'Janus', NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', false, NULL, 10);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, NULL, 10);
INSERT INTO public.planet VALUES (4, 'Saturn', false, NULL, 10);
INSERT INTO public.planet VALUES (5, 'Uranus', false, NULL, 10);
INSERT INTO public.planet VALUES (6, 'Neptune', false, NULL, 10);
INSERT INTO public.planet VALUES (7, 'Pluto', false, NULL, 10);
INSERT INTO public.planet VALUES (8, 'Arion', false, NULL, 12);
INSERT INTO public.planet VALUES (1, 'Earth', true, 0, 10);
INSERT INTO public.planet VALUES (9, 'Arkas', false, NULL, 14);
INSERT INTO public.planet VALUES (10, 'Orbitar', false, NULL, 15);
INSERT INTO public.planet VALUES (11, 'Taphao Thong', false, NULL, 16);
INSERT INTO public.planet VALUES (12, 'Taphao Kaew', false, NULL, 16);
INSERT INTO public.planet VALUES (13, 'Dimidum', false, NULL, 17);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Xi Andromedae', NULL, 1, 223);
INSERT INTO public.star VALUES (2, 'Caffau''s Star', 13.000, 2, 4500);
INSERT INTO public.star VALUES (3, 'Cayrel''s Star', 13.000, 2, 14000);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', NULL, 2, 4);
INSERT INTO public.star VALUES (5, 'Sirius', NULL, 2, 9);
INSERT INTO public.star VALUES (6, 'Regulus', NULL, 2, 79);
INSERT INTO public.star VALUES (7, 'NGC-206', NULL, 1, 2400000);
INSERT INTO public.star VALUES (8, 'Canopus', NULL, 2, 309);
INSERT INTO public.star VALUES (9, 'Polaris', NULL, 2, 323);
INSERT INTO public.star VALUES (10, 'the Sun', 4.603, 2, 0);
INSERT INTO public.star VALUES (12, 'Musica', NULL, 7, NULL);
INSERT INTO public.star VALUES (13, 'Veritate', NULL, 1, NULL);
INSERT INTO public.star VALUES (14, 'Intercus', NULL, 2, NULL);
INSERT INTO public.star VALUES (15, 'Fafnir', NULL, 2, NULL);
INSERT INTO public.star VALUES (16, 'Chalawan', NULL, 2, NULL);
INSERT INTO public.star VALUES (17, '51 Pegasi', NULL, 2, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 17, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

