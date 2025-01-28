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
    name character varying(30) NOT NULL,
    observation_notes text
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
    pgc integer,
    diameter_ly integer,
    mass_m numeric,
    distance_kpc numeric,
    observation_notes text
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
    name character varying(30) NOT NULL,
    mean_radius_km numeric,
    mass_kg numeric,
    surface_temp_k numeric,
    composition text,
    discovered_by character varying(100),
    observation_notes text,
    bigger_than_our_moon boolean,
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
    name character varying(30) NOT NULL,
    discovery_date date,
    mass_m numeric,
    mean_radius_r numeric,
    temperature_k numeric,
    distance_ly numeric,
    observation_notes text,
    could_habitate boolean,
    discovered_by character varying(100),
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
    name character varying(30) NOT NULL,
    mass_m numeric,
    radius_r numeric,
    distance_kpc numeric,
    observation_notes text,
    galaxy_id integer
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

INSERT INTO public.constellation VALUES (1, 'Sagittarius', NULL);
INSERT INTO public.constellation VALUES (2, 'Centaurus', NULL);
INSERT INTO public.constellation VALUES (3, 'Ophiuchus', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 87400, 1150000000000, 7.935, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2557, 152000, 1150000000000, 765, NULL);
INSERT INTO public.galaxy VALUES (3, 'Leo I', 29488, 2000, 25000000, 250, NULL);
INSERT INTO public.galaxy VALUES (4, 'Leo II', 34176, 4200, 27000000, 210, NULL);
INSERT INTO public.galaxy VALUES (5, 'Phoenix Dwarf', 6830, 1924, NULL, 440, NULL);
INSERT INTO public.galaxy VALUES (6, 'Barnards galaxy', 63616, 7000, NULL, 500, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.4, 73460000000000000000000, 250, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.08, 10600000000000000, 233, NULL, 'Asaph Hall', NULL, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.27, 1510000000000000, 233, NULL, 'Asaph Hall', NULL, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634.1, 148190000000000000000000, 110, NULL, 'Galileo Galilei and Simon Marius', NULL, true, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 2410.3, 107593800000000000000000, 134, NULL, 'Galileo Galilei and Simon Marius', NULL, true, 5);
INSERT INTO public.moon VALUES (6, 'Io', 1821.6, 89319380000000000000000, 110, NULL, 'Galileo Galilei', NULL, true, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 1560.8, 47998400000000000000000, 102, NULL, 'Galileo Galilei and Simon Marius', NULL, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2574.73, 134520000000000000000000, 93.7, NULL, 'Christiaan Huygens', NULL, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.1, 108031800000000000000, 75, NULL, 'William Herschel', NULL, false, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', 135, 5551000000000000000, 93, NULL, 'William Bond, George Bond and William Lassell', NULL, false, 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', 43.1, 159722000000000000, 74, NULL, 'Voyager 1', NULL, false, 6);
INSERT INTO public.moon VALUES (12, 'Pandora', 40.7, 135700000000000000, 78, NULL, 'Voyager 1', NULL, false, 6);
INSERT INTO public.moon VALUES (13, 'Janus', 89.5, 1893880000000000000, 76, NULL, 'Audouin Dollfus', NULL, false, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', 235.8, 62930000000000000000, 60, NULL, 'Gerard P. Kuiper', NULL, false, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 578.9, 1233100000000000000000, 60, NULL, 'William Lassell', NULL, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 584.7, 1288500000000000000000, 75, NULL, 'William Lassell', NULL, false, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 1353.4, 21389000000000000000000, 38, NULL, 'William Lassell', NULL, false, 8);
INSERT INTO public.moon VALUES (18, 'Galatea', 88, 1940000000000000000, 51, NULL, 'Voyager 2', NULL, false, 8);
INSERT INTO public.moon VALUES (19, 'Despina', 75, 710000000000000000, 51, NULL, 'Voyager 2', NULL, false, 8);
INSERT INTO public.moon VALUES (20, 'Titania', 788.4, 3455000000000000000000, 70, NULL, 'William Herschel', NULL, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, 1, 1, 255, NULL, NULL, true, NULL, 3);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, 0.055, 0.3829, 437, NULL, NULL, false, NULL, 3);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, 0.815, 0.9499, 737, NULL, NULL, true, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 0.107, 0.533, 209, NULL, NULL, true, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 317.8, 10.973, 128, NULL, NULL, false, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 95.159, 9.1402, 134, NULL, NULL, false, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', '1781-03-13', 14.536, 4, 76, NULL, NULL, false, 'William Herschel', 3);
INSERT INTO public.planet VALUES (8, 'Neptune', '1846-09-23', 17.147, 3.883, 72, NULL, NULL, false, 'Johann Galle', 3);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', '2016-08-24', 1.07, 0.94, 234, 4.2, NULL, false, 'Anglada-Escudé et al', 4);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', '2012-10-16', 1.13, 0.863, 1773, 4.37, NULL, false, 'Dumusque et al.', 6);
INSERT INTO public.planet VALUES (11, 'Barnards Star b', '2014-10-01', 0.37, NULL, 400, NULL, NULL, false, 'González Hernández et al.', 7);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', '2020-01-01', 7, NULL, 39, 4.2, NULL, false, 'Damasso et al.', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sun', 1, 1, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.1221, 0.1542, 0.001302, NULL, 1);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 1.079, 1.20, 0.0013325, NULL, 1);
INSERT INTO public.star VALUES (6, 'Toliman', 0.909, 0.90, 0.0013325, NULL, 1);
INSERT INTO public.star VALUES (7, 'Barnards Star', 0.162, 0.187, 0.001828, NULL, 1);
INSERT INTO public.star VALUES (8, 'Luhman 16A', 0.034, 0.087, 0.002, NULL, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet constraintname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT constraintname UNIQUE (name);


--
-- Name: galaxy galaxy_pgc_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pgc_key UNIQUE (pgc);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

