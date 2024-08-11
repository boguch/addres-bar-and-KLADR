--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-11 17:08:58

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
-- TOC entry 222 (class 1259 OID 16647)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    socr character varying(50),
    name character varying(50),
    code character varying(50)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16646)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 221
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- TOC entry 218 (class 1259 OID 16601)
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.district (
    id integer NOT NULL,
    socr character varying(50),
    name character varying(50),
    code character varying(50)
);


ALTER TABLE public.district OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16600)
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.district_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 217
-- Name: district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.district_id_seq OWNED BY public.district.id;


--
-- TOC entry 228 (class 1259 OID 16747)
-- Name: doma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doma (
    id integer NOT NULL,
    name character varying(50),
    code character varying(50)
);


ALTER TABLE public.doma OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16746)
-- Name: doma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doma_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 227
-- Name: doma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doma_id_seq OWNED BY public.doma.id;


--
-- TOC entry 216 (class 1259 OID 16565)
-- Name: onedatabase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.onedatabase (
    id integer NOT NULL,
    name character varying(255),
    socr character varying(255),
    code character varying(255)
);


ALTER TABLE public.onedatabase OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16564)
-- Name: onedatabase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.onedatabase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.onedatabase_id_seq OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 215
-- Name: onedatabase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.onedatabase_id_seq OWNED BY public.onedatabase.id;


--
-- TOC entry 220 (class 1259 OID 16617)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    socr character varying(50),
    name character varying(50),
    code character varying(50)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16616)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.region_id_seq OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 219
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- TOC entry 224 (class 1259 OID 16687)
-- Name: socrbase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socrbase (
    id integer NOT NULL,
    level character varying(20),
    socr character varying(20)
);


ALTER TABLE public.socrbase OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16686)
-- Name: socrbase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socrbase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socrbase_id_seq OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 223
-- Name: socrbase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socrbase_id_seq OWNED BY public.socrbase.id;


--
-- TOC entry 226 (class 1259 OID 16739)
-- Name: street; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.street (
    id integer NOT NULL,
    socr character varying(20),
    name character varying(100),
    code character varying(20)
);


ALTER TABLE public.street OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16738)
-- Name: street_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.street_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.street_id_seq OWNER TO postgres;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 225
-- Name: street_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.street_id_seq OWNED BY public.street.id;


--
-- TOC entry 4721 (class 2604 OID 16650)
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 16604)
-- Name: district id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district ALTER COLUMN id SET DEFAULT nextval('public.district_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16750)
-- Name: doma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doma ALTER COLUMN id SET DEFAULT nextval('public.doma_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16568)
-- Name: onedatabase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onedatabase ALTER COLUMN id SET DEFAULT nextval('public.onedatabase_id_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16620)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16690)
-- Name: socrbase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socrbase ALTER COLUMN id SET DEFAULT nextval('public.socrbase_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16742)
-- Name: street id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street ALTER COLUMN id SET DEFAULT nextval('public.street_id_seq'::regclass);


--
-- TOC entry 4732 (class 2606 OID 16652)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 2606 OID 16606)
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16752)
-- Name: doma doma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doma
    ADD CONSTRAINT doma_pkey PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 16570)
-- Name: onedatabase onedatabase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onedatabase
    ADD CONSTRAINT onedatabase_pkey PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 16622)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 16692)
-- Name: socrbase socrbase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socrbase
    ADD CONSTRAINT socrbase_pkey PRIMARY KEY (id);


--
-- TOC entry 4736 (class 2606 OID 16744)
-- Name: street street_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (id);


-- Completed on 2024-08-11 17:08:58

--
-- PostgreSQL database dump complete
--

