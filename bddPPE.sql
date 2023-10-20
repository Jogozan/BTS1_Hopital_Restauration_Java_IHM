--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.19
-- Dumped by pg_dump version 11.1

-- Started on 2021-09-21 13:29:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2033 (class 1262 OID 55668)
-- Name: PPE2022_RestaurationMSP; Type: DATABASE; Schema: -; Owner: parent
--

CREATE DATABASE "PPE2022_RestaurationMSP" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE "PPE2022_RestaurationMSP" OWNER TO parent;

\connect "PPE2022_RestaurationMSP"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2027 (class 0 OID 55761)
-- Dependencies: 177
-- Data for Name: Commande; Type: TABLE DATA; Schema: public; Owner: parent
--



--
-- TOC entry 2024 (class 0 OID 55690)
-- Dependencies: 174
-- Data for Name: Patient; Type: TABLE DATA; Schema: public; Owner: parent
--



--
-- TOC entry 2025 (class 0 OID 55716)
-- Dependencies: 175
-- Data for Name: Personnel; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public."Personnel" (id, nom, mdp, "idService") VALUES (1, 'pierre', 'pierre', 1);


--
-- TOC entry 2023 (class 0 OID 55685)
-- Dependencies: 173
-- Data for Name: Service; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public."Service" (id, libelle) VALUES (1, 'Maternité');


--
-- TOC entry 2026 (class 0 OID 55731)
-- Dependencies: 176
-- Data for Name: TypeRepas; Type: TABLE DATA; Schema: public; Owner: parent
--



-- Completed on 2021-09-21 13:29:21

--
-- PostgreSQL database dump complete
--

