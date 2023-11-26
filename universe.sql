--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    notable_features text,
    name character varying(60) NOT NULL,
    type character varying(30),
    size_in_lightyears numeric,
    distance_from_earth integer,
    number_of_stars integer,
    is_seyfert boolean,
    is_dwarf boolean
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
    notable_features text,
    name character varying(60) NOT NULL,
    parent_planet character varying(30),
    size numeric,
    mass integer,
    has_magnetic_field boolean,
    has_atmosphere boolean,
    distance_from_parent integer,
    planet_id integer
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
    notable_features text,
    name character varying(60) NOT NULL,
    type character varying(30),
    mass numeric,
    distance_from_star integer,
    circumference_miles integer,
    has_rings boolean,
    has_moons boolean,
    star_id integer
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    notable_features text,
    number_of_planets integer NOT NULL,
    star_type character varying(50),
    distance_from_earth integer
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    notable_features text,
    name character varying(60) NOT NULL,
    type character varying(30),
    mass numeric,
    radius integer,
    temperature_in_c integer,
    is_pulsar boolean,
    is_binary boolean,
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral arms with dust lane', 'Milky Way', 'Spiral', 100000, 0, 100, false, false);
INSERT INTO public.galaxy VALUES (2, 'Elliptical Shape', 'Andromeda', 'Elliptical', 150000, 2000000, 1, false, false);
INSERT INTO public.galaxy VALUES (3, 'Irregular Morpology', 'Magellanic Cloud', 'Irregular', 5000, 170000, 30, false, true);
INSERT INTO public.galaxy VALUES (4, 'Barred spiral Structure', 'Messier 83', 'Barred Spiral', 40000, 12000000, 40, true, false);
INSERT INTO public.galaxy VALUES (5, 'Bright central bulge', 'NGC 224', 'Spiral', 80000, 3000000, 80, false, false);
INSERT INTO public.galaxy VALUES (6, 'Distinct spiral arms', 'Whirlpool Galaxy', 'Spiral', 60000, 25000000, 60, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ice-covered surface', 'Europa', 'Jupiter', 3121, 4, false, false, 671100, 3);
INSERT INTO public.moon VALUES (2, 'Large cratered surface', 'Callisto', 'Jupiter', 4800, 10, false, false, 1882700, 3);
INSERT INTO public.moon VALUES (3, 'Thin atmosphere', 'Titan', 'Saturn', 5149, 13, false, true, 759000, 2);
INSERT INTO public.moon VALUES (4, 'Active volcanoes', 'Io', 'Jupiter', 3642, 9, false, false, 421800, 3);
INSERT INTO public.moon VALUES (5, 'Dark, heavily cratered surface', 'Ganymede', 'Jupiter', 5262, 13, false, false, 1070400, 3);
INSERT INTO public.moon VALUES (6, 'Volcanically active', 'Enceladus', 'Saturn', 310, 0, false, true, 147950, 2);
INSERT INTO public.moon VALUES (7, 'Rocky surface with canyons', 'Miranda', 'Uranus', 290, 0, false, false, 129390, 7);
INSERT INTO public.moon VALUES (8, 'Largest moon of Neptune', 'Triton', 'Neptune', 2707, 2, false, false, 354760, 5);
INSERT INTO public.moon VALUES (9, 'Thick atmosphere', 'Titan II', 'Saturn', 4040, 11, false, true, 960000, 2);
INSERT INTO public.moon VALUES (10, 'Molten surface', 'Io II', 'Jupiter', 3500, 8, false, false, 362400, 3);
INSERT INTO public.moon VALUES (11, 'Highly cratered surface', 'Dione', 'Saturn', 698, 0, false, false, 234590, 2);
INSERT INTO public.moon VALUES (12, 'Dark surface with grooved terrain', 'Iapetus', 'Saturn', 1469, 0, false, false, 3561000, 2);
INSERT INTO public.moon VALUES (13, 'Geologically active', 'Enceladus II', 'Saturn', 310, 0, false, true, 147950, 2);
INSERT INTO public.moon VALUES (14, 'Outermost moon of Jupiter', 'Callirrhoe', 'Jupiter', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (15, 'Large moon with a thin atmosphere', 'Oberon', 'Uranus', 761, 0, false, false, 584270, 7);
INSERT INTO public.moon VALUES (16, 'Icy surface with cracks', 'Rhea', 'Saturn', 949, 0, false, false, 327070, 2);
INSERT INTO public.moon VALUES (17, 'Thin atmosphere', 'Ariel', 'Uranus', 719, 0, false, true, 191020, 7);
INSERT INTO public.moon VALUES (18, 'Large moon with complex terrain', 'Titania', 'Uranus', 981, 0, false, false, 435910, 7);
INSERT INTO public.moon VALUES (19, 'Geologically active', 'Triton II', 'Neptune', 2707, 2, false, true, 354760, 5);
INSERT INTO public.moon VALUES (20, 'Captured asteroid', 'Phobos', 'Mars', 11, 0, false, false, 9377, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Reddish appearance', 'Mars', 'Terrestrial', 639000000000000000000000, 142, 2135, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Rings made of ice particles', 'Saturn', 'Gas Giant', 568000000000000000000000000, 886, 20250, true, true, 2);
INSERT INTO public.planet VALUES (3, 'Largest planet in the Solar System', 'Jupiter', 'Gas Giant', 1898000000000000000000000000, 484, 27200, false, false, 2);
INSERT INTO public.planet VALUES (4, 'Closest to the Sun', 'Mercury', 'Terrestrial', 328500000000000000000000, 36, 964, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Stormy atmosphere', 'Neptune', 'Ice Giant', 102400000000000000000000000, 3, 30600, true, false, 3);
INSERT INTO public.planet VALUES (6, 'Earth-like features', 'Kepler-452b', 'Terrestrial', NULL, 1406, NULL, false, false, 4);
INSERT INTO public.planet VALUES (7, 'Retrograde rotation', 'Venus', 'Terrestrial', 4870000000000000000000000, 67, 9907, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Blue appearance', 'Uranus', 'Ice Giant', 86800000000000000000000000, 2, 25362, true, false, 2);
INSERT INTO public.planet VALUES (9, 'Dwarf planet', 'Pluto', 'Dwarf Planet', 13030000000000000000000, 4, 473, false, false, 1);
INSERT INTO public.planet VALUES (10, 'Gas giant with a Great Red Spot', 'Hubble-35b', 'Gas Giant', NULL, 1500, NULL, false, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Frozen surface', 'Europa', 'Moon', NULL, NULL, NULL, false, false, 2);
INSERT INTO public.planet VALUES (12, 'Large cratered surface', 'Callisto', 'Moon', NULL, NULL, NULL, false, false, 2);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 'Home to the Sun, planets, moons, and other celestial bodies', 8, 'G-type Main Sequence', 0);
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri System', 'Closest star system to the Solar System', 3, 'Binary Star System', 4);
INSERT INTO public.solar_system VALUES (3, 'Trappist-1 System', 'Known for its seven Earth-sized planets', 7, 'Ultra-Cool Dwarf', 40);
INSERT INTO public.solar_system VALUES (4, 'Kepler-186 System', 'Hosts the first Earth-sized exoplanet discovered in the habitable zone', 5, 'Red Dwarf', 500);
INSERT INTO public.solar_system VALUES (5, 'Epsilon Eridani System', 'Star system with a debris disk and multiple exoplanets', 3, 'K-type Main Sequence', 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'High luminosity', 'Sun', 'Main Sequence', 1989000000000000000000000000000, 696340, 5500, false, false, 1);
INSERT INTO public.star VALUES (2, 'Binary system', 'Alpha Centauri A', 'Main Sequence', 2200000000000000000000000000000, 864340, 5790, false, true, 1);
INSERT INTO public.star VALUES (3, 'Variable star', 'Betelgeuse', 'Red Supergiant', 11600000000000000000000000000000, 887000, 3500, false, false, 2);
INSERT INTO public.star VALUES (4, 'Pulsar with strong magnetic field', 'PSR B1937+21', 'Neutron Star', 1400000000000000000000000000000, 10, 1000000, true, false, 3);
INSERT INTO public.star VALUES (5, 'Binary pulsar system', 'PSR J0737-3039', 'Neutron Star', 2600000000000000000000000000000, 15, 1600000, true, true, 3);
INSERT INTO public.star VALUES (6, 'Blue giant', 'Rigel', 'Blue Supergiant', 23600000000000000000000000000000, 78, 11000, false, false, 2);
INSERT INTO public.star VALUES (7, 'Binary system with a white dwarf companion', 'Sirius', 'Main Sequence', 3470000000000000000000000000000, 1710000, 9940, false, true, 1);
INSERT INTO public.star VALUES (8, 'Red supergiant with variable brightness', 'Antares', 'Red Supergiant', 18000000000000000000000000000000, 883000000, 3500, false, false, 2);
INSERT INTO public.star VALUES (9, 'Binary system with a neutron star companion', 'Cygnus X-1', 'Main Sequence', 20000000000000000000000000000000, 12000000, 30000, false, true, 4);
INSERT INTO public.star VALUES (10, 'Blue giant in the constellation Orion', 'Bellatrix', 'Blue Giant', 8600000000000000000000000000000, 5700000, 22000, false, false, 5);
INSERT INTO public.star VALUES (11, 'Binary system with a red dwarf companion', 'Proxima Centauri', 'Main Sequence', 123000000000000000000000000000, 154000, 3050, false, true, 2);


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
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet__name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet__name UNIQUE (name);


--
-- Name: star unique_star__name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star__name UNIQUE (name);


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

