--
-- PostgreSQL database dump
--

\restrict Q72pxvrem9QLvVmhK5aTifQ4EQ9bzzpGAbimNHZFfojeuuN36UBJHThXMFK3ZzG

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-19 15:36:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 229 (class 1259 OID 25033)
-- Name: clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases (
    id_clase integer NOT NULL,
    nombre character varying(40) NOT NULL,
    dia_semana character varying(15) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    id_entrenador integer NOT NULL,
    estado character varying(50) DEFAULT 'Activa'::character varying NOT NULL,
    CONSTRAINT clases_cupo_check CHECK ((cupo > 0)),
    CONSTRAINT mirarestado CHECK (((estado)::text = ANY ((ARRAY['Activa'::character varying, 'suspendida'::character varying])::text[])))
);


ALTER TABLE public.clases OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25032)
-- Name: clases_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_id_clase_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 228
-- Name: clases_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_id_clase_seq OWNED BY public.clases.id_clase;


--
-- TOC entry 221 (class 1259 OID 24963)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id_entrenador integer NOT NULL,
    nombre character varying(50) NOT NULL,
    especialidad character varying(30) NOT NULL,
    correo character varying(50) NOT NULL
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24962)
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 220
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNED BY public.entrenadores.id_entrenador;


--
-- TOC entry 225 (class 1259 OID 24989)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    id_ficha integer NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(4,2) NOT NULL,
    lesiones text,
    numero_documento character varying(20) NOT NULL,
    CONSTRAINT fichas_medicas_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT fichas_medicas_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24988)
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fichas_medicas_id_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 224
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNED BY public.fichas_medicas.id_ficha;


--
-- TOC entry 231 (class 1259 OID 25052)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id_inscripcion integer NOT NULL,
    fecha_inscripcion date DEFAULT CURRENT_DATE NOT NULL,
    numero_documento character varying(20) NOT NULL,
    id_clase integer NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25051)
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 230
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNED BY public.inscripciones.id_inscripcion;


--
-- TOC entry 227 (class 1259 OID 25011)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id_membresia integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    numero_documento character varying(20) NOT NULL,
    id_plan integer NOT NULL,
    valor_pagado numeric(12,0) NOT NULL,
    CONSTRAINT membresia_fechas CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT membresia_pagado CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25010)
-- Name: membresias_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 226
-- Name: membresias_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_membresia_seq OWNED BY public.membresias.id_membresia;


--
-- TOC entry 233 (class 1259 OID 25096)
-- Name: ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ocupacion_clases AS
 SELECT c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.id_inscripcion) AS inscritos
   FROM (public.clases c
     LEFT JOIN public.inscripciones i ON ((c.id_clase = i.id_clase)))
  WHERE ((c.estado)::text = 'Activa'::text)
  GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.ocupacion_clases OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24976)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_plan integer NOT NULL,
    nombre character varying(30) NOT NULL,
    duracion_meses integer NOT NULL,
    precio numeric(12,0) NOT NULL,
    CONSTRAINT planes_duracion_meses_check CHECK ((duracion_meses > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24975)
-- Name: planes_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_plan_seq OWNER TO postgres;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 222
-- Name: planes_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_plan_seq OWNED BY public.planes.id_plan;


--
-- TOC entry 219 (class 1259 OID 24951)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    numero_documento character varying(20) NOT NULL,
    nombre character varying(50) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(50),
    acepta_whatsapp boolean DEFAULT false NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25091)
-- Name: socios_vencidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.socios_vencidos AS
 SELECT s.nombre,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS ultima_membresia
   FROM (public.socios s
     JOIN public.membresias m ON (((s.numero_documento)::text = (m.numero_documento)::text)))
  GROUP BY s.numero_documento, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.socios_vencidos OWNER TO postgres;

--
-- TOC entry 4898 (class 2604 OID 25036)
-- Name: clases id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_id_clase_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 24966)
-- Name: entrenadores id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenadores_id_entrenador_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 24992)
-- Name: fichas_medicas id_ficha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas ALTER COLUMN id_ficha SET DEFAULT nextval('public.fichas_medicas_id_ficha_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 25055)
-- Name: inscripciones id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripciones_id_inscripcion_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 25014)
-- Name: membresias id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresias_id_membresia_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 24979)
-- Name: planes id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_plan SET DEFAULT nextval('public.planes_id_plan_seq'::regclass);


--
-- TOC entry 5097 (class 0 OID 25033)
-- Dependencies: 229
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases (id_clase, nombre, dia_semana, hora, cupo, id_entrenador, estado) FROM stdin;
1	Spinning Master	Lunes	06:00:00	2	1	Activa
3	Functional Core	Miércoles	18:00:00	10	1	Activa
4	Power Cycling	Jueves	07:00:00	12	2	Activa
2	Yoga Relax	Martes	08:00:00	15	2	suspendida
5	Pilates	Viernes	18:00:00	12	2	Activa
\.


--
-- TOC entry 5089 (class 0 OID 24963)
-- Dependencies: 221
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Carlos Zapata	Spinning	carlos.zapata@cuerpoactivo.com
2	Mariana Mesa	Yoga	mariana.mesa@cuerpoactivo.com
3	Esteban Ospina	Funcional	esteban.ospina@cuerpoactivo.com
\.


--
-- TOC entry 5093 (class 0 OID 24989)
-- Dependencies: 225
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (id_ficha, peso, estatura, lesiones, numero_documento) FROM stdin;
1	75.50	1.78	Ninguna	1234567
2	62.00	1.65	Molestia leve en la rodilla derecha	1023456789
3	88.30	1.82	Lumbalgia ocasional	1034567890
4	54.20	1.60	Ninguna	1045678901
\.


--
-- TOC entry 5099 (class 0 OID 25052)
-- Dependencies: 231
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id_inscripcion, fecha_inscripcion, numero_documento, id_clase) FROM stdin;
1	2026-10-01	1234567	1
2	2026-10-02	1023456789	1
3	2026-10-01	1023456789	2
4	2026-10-03	1034567890	2
5	2026-10-04	1034567890	3
6	2026-10-05	1045678901	3
7	2026-10-06	1045678901	4
8	2026-10-07	1056789012	4
9	2026-10-08	1234567	3
10	2026-10-09	1023456789	4
15	2026-11-19	1056789012	5
\.


--
-- TOC entry 5095 (class 0 OID 25011)
-- Dependencies: 227
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id_membresia, fecha_inicio, fecha_fin, numero_documento, id_plan, valor_pagado) FROM stdin;
1	2025-01-01	2025-02-01	1234567	1	90000
2	2026-01-10	2026-04-10	1023456789	2	260000
3	2025-11-01	2025-12-01	1034567890	1	90000
5	2026-06-01	2026-12-01	1045678901	3	190000
6	2026-06-15	2027-06-15	1056789012	4	1000000
7	2026-06-15	2027-06-15	1056789012	4	1000000
8	2026-07-01	2026-08-01	1067890123	1	90000
\.


--
-- TOC entry 5091 (class 0 OID 24976)
-- Dependencies: 223
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_plan, nombre, duracion_meses, precio) FROM stdin;
1	Plan Basico	1	90000
2	Plan medio	3	260000
3	Plan avanzado	6	520000
4	Plan premium	12	1000000
\.


--
-- TOC entry 5087 (class 0 OID 24951)
-- Dependencies: 219
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (numero_documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
1034567890	Mateo Gómez	3157891234	mateo.gomez@correo.com	f
1045678901	Valentina Ríos	3209876543	valen.rios@correo.com	f
1056789012	Sebastián Cardona	3016549870	sebas.cardona@correo.com	f
1067890123	Sofía Herrera	3123216549	\N	f
1234567	Eucalipto Torres	123456	bebesitobblimc@correo.com	t
1023456789	Camila Restrepo	3104567890	camila.restrepo@correo.com	t
\.


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 228
-- Name: clases_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_id_clase_seq', 5, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 220
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_entrenador_seq', 3, true);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 224
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fichas_medicas_id_ficha_seq', 4, true);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 230
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 15, true);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 226
-- Name: membresias_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_membresia_seq', 9, true);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 222
-- Name: planes_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_plan_seq', 4, true);


--
-- TOC entry 4927 (class 2606 OID 25045)
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4915 (class 2606 OID 24974)
-- Name: entrenadores entrenadores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_correo_key UNIQUE (correo);


--
-- TOC entry 4917 (class 2606 OID 24972)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4921 (class 2606 OID 25004)
-- Name: fichas_medicas fichas_medicas_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_numero_documento_key UNIQUE (numero_documento);


--
-- TOC entry 4923 (class 2606 OID 25002)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (id_ficha);


--
-- TOC entry 4929 (class 2606 OID 25062)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id_inscripcion);


--
-- TOC entry 4925 (class 2606 OID 25021)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4919 (class 2606 OID 24987)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4911 (class 2606 OID 24961)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4913 (class 2606 OID 24959)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (numero_documento);


--
-- TOC entry 4931 (class 2606 OID 25064)
-- Name: inscripciones uk_socio_clase; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT uk_socio_clase UNIQUE (numero_documento, id_clase);


--
-- TOC entry 4935 (class 2606 OID 25046)
-- Name: clases clases_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id_entrenador);


--
-- TOC entry 4932 (class 2606 OID 25005)
-- Name: fichas_medicas fichas_medicas_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


--
-- TOC entry 4936 (class 2606 OID 25070)
-- Name: inscripciones inscripciones_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases(id_clase) ON DELETE CASCADE;


--
-- TOC entry 4937 (class 2606 OID 25065)
-- Name: inscripciones inscripciones_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


--
-- TOC entry 4933 (class 2606 OID 25027)
-- Name: membresias membresias_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.planes(id_plan);


--
-- TOC entry 4934 (class 2606 OID 25086)
-- Name: membresias membresias_numero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_numero FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


-- Completed on 2026-11-19 15:36:31

--
-- PostgreSQL database dump complete
--

\unrestrict Q72pxvrem9QLvVmhK5aTifQ4EQ9bzzpGAbimNHZFfojeuuN36UBJHThXMFK3ZzG

