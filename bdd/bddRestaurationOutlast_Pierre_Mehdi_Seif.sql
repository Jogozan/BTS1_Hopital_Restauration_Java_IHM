--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.19
-- Dumped by pg_dump version 11.1

-- Started on 2021-10-22 15:27:57

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
-- TOC entry 2056 (class 1262 OID 55668)
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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 56075)
-- Name: commande; Type: TABLE; Schema: public; Owner: parent
--

CREATE TABLE public.commande (
    numero integer NOT NULL,
    idpatient integer,
    idrepas integer,
    idservice integer
);


ALTER TABLE public.commande OWNER TO parent;

--
-- TOC entry 177 (class 1259 OID 56073)
-- Name: commande_numero_seq; Type: SEQUENCE; Schema: public; Owner: parent
--

CREATE SEQUENCE public.commande_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_numero_seq OWNER TO parent;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 177
-- Name: commande_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parent
--

ALTER SEQUENCE public.commande_numero_seq OWNED BY public.commande.numero;


--
-- TOC entry 179 (class 1259 OID 56644)
-- Name: historique; Type: TABLE; Schema: public; Owner: parent
--

CREATE TABLE public.historique (
    id integer NOT NULL,
    idpersonnel integer NOT NULL,
    date character varying(20) NOT NULL,
    heure character varying(20) NOT NULL
);


ALTER TABLE public.historique OWNER TO parent;

--
-- TOC entry 174 (class 1259 OID 55690)
-- Name: patient; Type: TABLE; Schema: public; Owner: parent
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    nom character varying(70) NOT NULL,
    idservice integer,
    numchambre integer
);


ALTER TABLE public.patient OWNER TO parent;

--
-- TOC entry 182 (class 1259 OID 56707)
-- Name: patient2_id_seq; Type: SEQUENCE; Schema: public; Owner: parent
--

CREATE SEQUENCE public.patient2_id_seq
    START WITH 6
    INCREMENT BY 1
    MINVALUE 6
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient2_id_seq OWNER TO parent;

--
-- TOC entry 181 (class 1259 OID 56704)
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: parent
--

CREATE SEQUENCE public.patient_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 5
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_id_seq OWNER TO parent;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 181
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parent
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- TOC entry 175 (class 1259 OID 55716)
-- Name: personnel; Type: TABLE; Schema: public; Owner: parent
--

CREATE TABLE public.personnel (
    id integer NOT NULL,
    nom character varying(20) NOT NULL,
    mdp character varying(100) NOT NULL,
    idservice integer NOT NULL
);


ALTER TABLE public.personnel OWNER TO parent;

--
-- TOC entry 173 (class 1259 OID 55685)
-- Name: service; Type: TABLE; Schema: public; Owner: parent
--

CREATE TABLE public.service (
    id integer NOT NULL,
    libelle character varying(20) NOT NULL
);


ALTER TABLE public.service OWNER TO parent;

--
-- TOC entry 180 (class 1259 OID 56701)
-- Name: test_id_historique; Type: SEQUENCE; Schema: public; Owner: parent
--

CREATE SEQUENCE public.test_id_historique
    START WITH 2
    INCREMENT BY 1
    MINVALUE 2
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_historique OWNER TO parent;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 180
-- Name: test_id_historique; Type: SEQUENCE OWNED BY; Schema: public; Owner: parent
--

ALTER SEQUENCE public.test_id_historique OWNED BY public.historique.id;


--
-- TOC entry 176 (class 1259 OID 55731)
-- Name: typerepas; Type: TABLE; Schema: public; Owner: parent
--

CREATE TABLE public.typerepas (
    id integer NOT NULL,
    libelle character varying(30)
);


ALTER TABLE public.typerepas OWNER TO parent;

--
-- TOC entry 1912 (class 2604 OID 56078)
-- Name: commande numero; Type: DEFAULT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.commande ALTER COLUMN numero SET DEFAULT nextval('public.commande_numero_seq'::regclass);


--
-- TOC entry 1913 (class 2604 OID 56703)
-- Name: historique id; Type: DEFAULT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.historique ALTER COLUMN id SET DEFAULT nextval('public.test_id_historique'::regclass);


--
-- TOC entry 1911 (class 2604 OID 56706)
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- TOC entry 2046 (class 0 OID 56075)
-- Dependencies: 178
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (1, 1, 1, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (4, 4, 4, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (5, 2, 2, 4);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (6, 3, 4, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (8, 21, 1, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (9, 56, 5, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (10, 43, 3, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (2, 67, 1, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (3, 90, 2, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (7, 77, 2, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (11, 45, 2, 7);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (12, 33, 5, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (13, 92, 2, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (14, 98, 1, 8);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (15, 105, 4, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (16, 36, 3, 11);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (17, 49, 5, 8);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (18, 55, 1, 12);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (19, 88, 3, 11);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (20, 66, 2, 7);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (21, 83, 3, 14);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (22, 19, 3, 10);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (23, 23, 5, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (24, 38, 1, 4);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (25, 20, 2, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (26, 150, 3, 14);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (27, 123, 4, 13);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (28, 110, 2, 12);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (29, 230, 3, 11);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (30, 205, 4, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (31, 178, 1, 6);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (32, 70, 5, 7);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (33, 32, 5, 8);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (34, 17, 3, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (35, 191, 1, 14);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (36, 109, 2, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (37, 144, 4, 2);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (38, 173, 2, 12);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (39, 101, 5, 8);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (40, 246, 1, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (41, 149, 3, 14);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (42, 39, 2, 12);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (43, 59, 4, 10);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (44, 71, 2, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (45, 236, 3, 7);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (46, 243, 5, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (47, 122, 4, 11);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (48, 105, 2, 2);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (49, 40, 5, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (50, 206, 1, 6);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (51, 222, 5, 13);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (52, 111, 2, 11);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (53, 159, 4, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (54, 178, 2, 7);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (55, 232, 3, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (56, 134, 1, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (57, 199, 4, 2);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (58, 198, 2, 4);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (59, 60, 4, 7);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (60, 72, 1, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (61, 164, 5, 3);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (62, 169, 3, 9);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (63, 137, 3, 1);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (64, 29, 2, 5);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (65, 77, 4, 11);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (66, 44, 5, 12);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (67, 55, 1, 13);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (68, 48, 4, 14);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (69, 185, 2, 4);
INSERT INTO public.commande (numero, idpatient, idrepas, idservice) VALUES (70, 188, 5, 10);


--
-- TOC entry 2047 (class 0 OID 56644)
-- Dependencies: 179
-- Data for Name: historique; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (1, 1, '15 10 2021', '16.25');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (6, 5, '15 10 2021', '16.27');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (7, 14, '15 10 2021', '16.57');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (8, 14, '22 10 2021', '13.16');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (9, 14, '22 10 2021', '13.16');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (10, 14, '22 10 2021', '13.32');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (11, 14, '22 10 2021', '13.33');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (12, 14, '22 10 2021', '13.41');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (13, 1, '22 10 2021', '13.41');
INSERT INTO public.historique (id, idpersonnel, date, heure) VALUES (14, 1, '22 octobre 2021', '14.37');


--
-- TOC entry 2042 (class 0 OID 55690)
-- Dependencies: 174
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (1, 'Bouguerouche', 1, 1);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (2, 'Parent', 2, 2);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (3, 'Florent', 1, 3);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (13, 'Sébastien Bonneau', 1, 13);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (14, 'Dominique Carlier', 1, 14);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (15, 'Michel Moreno', 1, 15);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (16, 'Patrick Le Rossi', 1, 16);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (18, 'Émile de la Aubert', 1, 18);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (20, 'Marcel-Stéphane Gaudin', 1, 20);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (22, 'Arthur Barbier', 1, 22);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (23, 'Célina Joubert de la Raymond', 1, 23);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (24, 'Claudine Maurice', 2, 24);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (25, 'Véronique Allain du Maillot', 2, 25);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (26, 'Zacharie Le Girard', 2, 26);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (28, 'Matthieu Renaud', 2, 28);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (29, 'Jacques Gros', 2, 29);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (30, 'Thierry Diallo', 2, 30);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (31, 'Sabine-Aurore Gauthier', 2, 31);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (33, 'Isabelle Legros-Benard', 2, 33);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (34, 'Daniel Maillot Le Lagarde', 2, 34);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (35, 'Inès Pichon', 2, 35);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (36, 'Dominique Roger de Guichard', 2, 36);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (37, 'Laurence Le Joseph', 2, 37);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (38, 'Hugues de la Begue', 2, 38);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (40, 'Yves Goncalves', 2, 40);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (41, 'Manon Fontaine', 2, 41);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (42, 'Marianne Chevallier Le Levy', 2, 42);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (44, 'Vincent de la Lesage', 3, 44);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (45, 'Christine de Jacques', 3, 45);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (46, 'Grégoire Bodin', 3, 46);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (47, 'Bernadette Besson', 3, 47);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (48, 'Roland Hamel', 3, 48);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (49, 'Joseph Blanc', 3, 49);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (51, 'Isaac Guillet-Marques', 3, 51);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (52, 'Jeannine Humbert', 3, 52);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (53, 'Guillaume de Carre', 3, 53);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (54, 'Martine Bruneau', 3, 54);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (56, 'Virginie de Pinto', 3, 56);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (57, 'Charles de Lelievre', 3, 57);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (58, 'Gabrielle Rousseau', 3, 58);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (59, 'Élise Dias', 3, 59);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (61, 'Monique du Albert', 3, 61);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (62, 'Alain Traore', 3, 62);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (63, 'Bernadette Leveque', 3, 63);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (64, 'Éléonore Bertrand', 4, 64);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (65, 'Michel Hebert', 4, 65);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (67, 'Lucas Chevalier', 4, 67);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (68, 'Marcelle Hubert-Lemonnier', 4, 68);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (69, 'Charlotte Albert', 4, 69);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (70, 'William Munoz', 4, 70);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (72, 'Nathalie Poulain Le Toussaint', 4, 72);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (73, 'Adrien de la Guilbert', 4, 73);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (74, 'Chantal Charpentier Le Samson', 4, 74);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (75, 'Suzanne Schneider', 4, 75);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (77, 'Benoît Lagarde', 4, 77);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (78, 'Michel Gregoire-Morvan', 4, 78);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (79, 'Madeleine Rodrigues', 4, 79);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (80, 'Zacharie Becker de Pages', 4, 80);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (82, 'Laetitia Poirier de la Baudry', 4, 82);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (83, 'Margaux Blanc-Jacquot', 4, 83);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (84, 'Josette Dubois', 5, 84);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (85, 'Laure-Manon Sanchez', 5, 85);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (86, 'Honoré Allain', 5, 86);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (88, 'Anouk Roy-Bernier', 5, 88);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (89, 'Anouk Gerard', 5, 89);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (90, 'Gérard Blanchet', 5, 90);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (92, 'Alex-Renée Lesage', 5, 92);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (93, 'Honoré du Delattre', 5, 93);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (94, 'Gilbert Leroux', 5, 94);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (95, 'Michelle Allard', 5, 95);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (96, 'Odette Lemoine', 5, 96);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (97, 'Claudine Pineau', 5, 97);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (99, 'Gérard Andre du Bernier', 5, 99);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (100, 'Aurore Perez', 5, 100);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (101, 'Patricia Allain Le Meyer', 5, 101);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (102, 'Olivier Labbe', 5, 102);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (104, 'Christelle Robert', 6, 104);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (105, 'Gérard Vidal', 6, 105);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (106, 'Luc Martel-Costa', 6, 106);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (107, 'Danielle Becker', 6, 107);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (109, 'Adrien Moreno', 6, 109);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (110, 'Emmanuel Marques', 6, 110);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (111, 'Rémy du Godard', 6, 111);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (112, 'Martin Charrier du Munoz', 6, 112);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (114, 'Denis Briand', 6, 114);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (116, 'Élise Chevalier', 6, 116);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (117, 'Martine Blondel', 6, 117);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (118, 'Adèle Gillet', 6, 118);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (119, 'Adrienne-Suzanne Evrard', 6, 119);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (121, 'Roland Royer', 6, 121);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (122, 'Charlotte Hebert', 6, 122);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (123, 'Guillaume Lemaitre', 6, 123);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (124, 'Aimé Rolland', 7, 124);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (126, 'Richard Perrin', 7, 126);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (127, 'Antoinette Rossi-Rousset', 7, 127);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (128, 'Alexandre Cousin', 7, 128);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (129, 'Laurence-Cécile Barbe', 7, 129);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (131, 'Jacques Guillot Le Simon', 7, 131);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (132, 'Valérie de la Masson', 7, 132);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (133, 'Jules Barthelemy de la Godard', 7, 133);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (135, 'Isaac Le Lebon', 7, 135);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (136, 'Lorraine Joubert', 7, 136);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (137, 'Richard Leclerc', 7, 137);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (138, 'Jules de la Descamps', 7, 138);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (139, 'Théophile Peltier', 7, 139);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (140, 'Grégoire Roux', 7, 140);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (141, 'Élodie Sauvage', 7, 141);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (143, 'Noël Petitjean', 7, 143);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (144, 'Claudine Thomas', 8, 144);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (145, 'Jérôme Pichon', 8, 145);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (146, 'Guillaume Simon', 8, 146);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (148, 'Léon Mallet', 8, 148);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (149, 'Jérôme Chretien', 8, 149);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (150, 'Luc Munoz', 8, 150);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (151, 'Robert Ledoux', 8, 151);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (153, 'Yves Gosselin-Rossi', 8, 153);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (154, 'Honoré Collin', 8, 154);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (155, 'Juliette Pons', 8, 155);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (4, 'Verriest', 1, 4);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (157, 'Aimée du Regnier', 8, 157);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (158, 'Virginie Caron', 8, 158);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (159, 'Timothée-Thibaut Vincent', 8, 159);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (160, 'Odette Le Mallet', 8, 160);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (161, 'Philippe Lagarde', 8, 161);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (162, 'Gérard Mercier', 8, 162);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (163, 'Luce Berger-Becker', 8, 163);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (164, 'Andrée Teixeira', 9, 164);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (165, 'Benjamin Camus', 9, 165);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (166, 'Frédéric Moreau', 9, 166);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (167, 'Stéphanie-Alexandrie Guillaume', 9, 167);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (168, 'Adrien Allain-Tessier', 9, 168);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (169, 'Théodore-Gilles Pichon', 9, 169);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (170, 'Antoinette Pelletier-Da Costa', 9, 170);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (171, 'Simone Fournier', 9, 171);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (172, 'Alexandre Fernandes', 9, 172);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (173, 'Émile Mary-Lambert', 9, 173);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (174, 'Catherine-Marguerite Herve', 9, 174);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (175, 'Édith Mary', 9, 175);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (176, 'Marine Evrard', 9, 176);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (177, 'Emmanuelle-Thérèse Bouvet', 9, 177);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (178, 'Arnaude Laporte', 9, 178);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (179, 'Bernadette Normand', 9, 179);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (180, 'Timothée Colin Le Mathieu', 9, 180);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (181, 'Roland-Tristan Marin', 9, 181);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (182, 'Emmanuelle Pages', 9, 182);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (183, 'Antoinette Giraud', 9, 183);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (184, 'Anaïs Gillet-Marion', 10, 184);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (185, 'Adrien Leroux', 10, 185);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (186, 'Yves Maillard', 10, 186);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (188, 'Cécile Blondel', 10, 188);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (189, 'Anne Cousin', 10, 189);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (190, 'Gabrielle-Marine Schmitt', 10, 190);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (191, 'Franck Leger Le Bonnin', 10, 191);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (192, 'Julien Da Costa', 10, 192);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (193, 'Zoé De Sousa', 10, 193);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (194, 'Michelle Adam', 10, 194);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (195, 'Hélène Perrin', 10, 195);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (196, 'Alexandrie Guyon', 10, 196);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (197, 'Éric Hardy', 10, 197);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (198, 'Amélie-Noémi Leclercq', 10, 198);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (199, 'Richard Charpentier', 10, 199);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (200, 'Noël Gay', 10, 200);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (201, 'Christophe de la Vallee', 10, 201);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (202, 'Hugues Laporte', 10, 202);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (203, 'Guy Neveu', 10, 203);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (204, 'Gabrielle Henry', 11, 204);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (205, 'Célina Le Ollivier', 11, 205);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (206, 'Josette Merle de la Bonnin', 11, 206);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (207, 'Sophie Fleury-Grondin', 11, 207);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (208, 'Philippine Lacroix', 11, 208);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (209, 'Chantal Perrin', 11, 209);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (210, 'Roger Le De Sousa', 11, 210);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (211, 'Diane Alves-Chevallier', 11, 211);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (212, 'Jérôme Godard', 11, 212);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (213, 'Geneviève Jourdan de Schneider', 11, 213);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (214, 'Noël Herve', 11, 214);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (215, 'Michelle Perrin', 11, 215);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (216, 'Édouard Bouvier', 11, 216);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (217, 'René Nicolas', 11, 217);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (218, 'Raymond Gerard', 11, 218);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (219, 'Xavier Joly', 11, 219);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (220, 'Célina Martins', 11, 220);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (221, 'Dominique Rodriguez', 11, 221);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (222, 'Stéphanie Le Bertrand', 11, 222);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (223, 'Astrid Paris', 11, 223);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (224, 'Michelle-Sylvie Jourdan', 12, 224);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (225, 'Pauline Brunet', 12, 225);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (226, 'Emmanuel Bouchet', 12, 226);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (227, 'Alphonse Le Baron', 12, 227);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (228, 'Corinne Berthelot', 12, 228);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (229, 'Susanne Bernier', 12, 229);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (230, 'Danielle Pichon', 12, 230);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (231, 'Michelle Collin', 12, 231);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (232, 'Marguerite Marchal-Toussaint', 12, 232);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (233, 'Simone Collet', 12, 233);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (234, 'René Guillon', 12, 234);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (235, 'Alexandre Blondel', 12, 235);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (236, 'Guillaume Marion', 12, 236);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (237, 'Étienne Le Poirier', 12, 237);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (238, 'Chantal Guyon', 12, 238);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (239, 'Anne Jacquot', 12, 239);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (240, 'Jeannine Arnaud Le Godard', 12, 240);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (241, 'René Traore', 12, 241);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (242, 'Claude-Lorraine Marques', 12, 242);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (243, 'Daniel Julien de la Masse', 12, 243);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (244, 'Émilie-Diane Pereira', 13, 244);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (245, 'Agnès Dijoux', 13, 245);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (246, 'Amélie Barre-Robert', 13, 246);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (247, 'Yves Paul', 13, 247);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (248, 'Emmanuelle Roux', 13, 248);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (249, 'Monique-Lorraine Gaudin', 13, 249);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (250, 'Tristan Riou', 13, 250);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (251, 'Margaux-Michèle Laporte', 13, 251);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (252, 'Robert Tanguy-Dumas', 13, 252);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (17, 'Marcel Henry', 1, 17);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (19, 'Raymond Lelievre Le Tanguy', 1, 19);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (27, 'Margaret Pelletier', 2, 27);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (39, 'Alexandrie Pascal', 2, 39);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (43, 'Philippine Francois-Chevallier', 2, 43);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (50, 'Xavier de Guerin', 3, 50);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (55, 'Yves Renaud du Chevallier', 3, 55);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (60, 'Roland Delorme-Lecomte', 3, 60);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (66, 'Camille Ferrand', 4, 66);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (71, 'Georges Clement', 4, 71);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (76, 'Zoé-Laurence Andre', 4, 76);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (81, 'Marianne Perrot du Fouquet', 4, 81);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (87, 'Martin Aubry', 5, 87);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (91, 'Frédéric du Grenier', 5, 91);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (98, 'Cécile Delahaye-Peron', 5, 98);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (103, 'Agnès Bonnin de Pierre', 5, 103);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (108, 'Clémence Prevost de la Grondin', 6, 108);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (115, 'Geneviève Lefevre', 6, 115);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (120, 'Lorraine-Luce Herve', 6, 120);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (125, 'Sophie de Labbe', 7, 125);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (130, 'Océane Riviere Le Mendes', 7, 130);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (134, 'Margaret Vaillant Le Alves', 7, 134);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (147, 'Luc Deschamps', 8, 147);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (152, 'Alice Grondin-Camus', 8, 152);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (156, 'Alice Muller', 8, 156);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (187, 'David Devaux', 10, 187);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (21, 'Michel Legros-Cordier', 1, 21);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (32, 'Éléonore Gosselin de la Leroy', 2, 32);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (113, 'Nathalie-Mathilde Normand', 6, 113);
INSERT INTO public.patient (id, nom, idservice, numchambre) VALUES (142, 'Éric Hubert de Pereira', 7, 142);


--
-- TOC entry 2043 (class 0 OID 55716)
-- Dependencies: 175
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (1, 'Admin', 'c1c224b03cd9bc7b6a86d77f5dace40191766c485cd55dc48caf9ac873335d6f', 14);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (2, 'Resto', '0c28a67bbe41c27e68d0b03ea1ce8300d549b85e10adba3aff98be2abeafaadc', 13);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (3, 'Maternite', '656a3efd255cb727a91e3f59dc4c32984b25520dea007e3da09c9027b1545ee3', 1);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (4, 'Dermatologie', 'd810e3e7b5e68161681ae255aad7ce18806a5560e48d8221450f44e72f298cba', 2);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (5, 'Urologie', 'cfff2fc7c9958ce72adbc960db677f18427f3fb5e1d6e6b44a201f0a85860945', 3);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (6, 'Pédiatrie', '42530d69f3646c45bedc1e1c19dc680142cdba931d630d06ab79efee29d580b4', 4);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (7, 'Cardiologie', 'cd1ef2a9927f45052bee6be705a5161a962ad0ab2437492b33b95c196d7430b2', 5);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (8, 'Chirurgie', 'c220f58e093883a8c6df2486f1df679d6ee1ae18b2f7236c058c9acb9e6072a4', 7);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (9, 'Pneumologie', '5b9649a728c5fc22bd6447774c3888a98fc5935cf18f974ca0d745f1d9a65d50', 8);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (10, 'Immunologie', '943195e1207ad9cec8b1d0026e9b51400d315d06ebbc53513d7430828039e33d', 9);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (11, 'Odontolongie', 'b850127b16f568190bd9e5a54ff28428cad064599222b12795a64048b7e38b2c', 10);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (12, 'Radiologie', '7da3d98d1b1c434978414ea937186329dc6db63e82d561801959d155a6bea219', 11);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (13, 'Neurologie', 'e5dc276f002d322057d08b5a5cdeb28e752a92be4d2eddf5fa36a58ff4393ef9', 12);
INSERT INTO public.personnel (id, nom, mdp, idservice) VALUES (14, 'Psychiatrie', '11fec3ef2645c1292cb96de8a912e79043379ca97b321205bed1f169bd737ddc', 6);


--
-- TOC entry 2041 (class 0 OID 55685)
-- Dependencies: 173
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public.service (id, libelle) VALUES (1, 'Maternité');
INSERT INTO public.service (id, libelle) VALUES (2, 'Dermatologie');
INSERT INTO public.service (id, libelle) VALUES (3, 'Urologie');
INSERT INTO public.service (id, libelle) VALUES (4, 'Pédiatrie
');
INSERT INTO public.service (id, libelle) VALUES (5, 'Cardiologie');
INSERT INTO public.service (id, libelle) VALUES (6, 'Psychiatrie');
INSERT INTO public.service (id, libelle) VALUES (7, 'Chirurgie
');
INSERT INTO public.service (id, libelle) VALUES (8, 'Pneumologie

');
INSERT INTO public.service (id, libelle) VALUES (9, 'Immunologie
');
INSERT INTO public.service (id, libelle) VALUES (10, 'Odontolongie
');
INSERT INTO public.service (id, libelle) VALUES (11, 'Radiologie');
INSERT INTO public.service (id, libelle) VALUES (12, 'Neurologie');
INSERT INTO public.service (id, libelle) VALUES (13, 'Restauration');
INSERT INTO public.service (id, libelle) VALUES (14, 'Administration');


--
-- TOC entry 2044 (class 0 OID 55731)
-- Dependencies: 176
-- Data for Name: typerepas; Type: TABLE DATA; Schema: public; Owner: parent
--

INSERT INTO public.typerepas (id, libelle) VALUES (1, 'Aucune restriction');
INSERT INTO public.typerepas (id, libelle) VALUES (2, 'Sans sel');
INSERT INTO public.typerepas (id, libelle) VALUES (3, 'Sans viande');
INSERT INTO public.typerepas (id, libelle) VALUES (4, 'Végetarien');
INSERT INTO public.typerepas (id, libelle) VALUES (5, 'Sans gluten');


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 177
-- Name: commande_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: parent
--

SELECT pg_catalog.setval('public.commande_numero_seq', 9, true);


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 182
-- Name: patient2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: parent
--

SELECT pg_catalog.setval('public.patient2_id_seq', 6, false);


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 181
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: parent
--

SELECT pg_catalog.setval('public.patient_id_seq', 252, true);


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 180
-- Name: test_id_historique; Type: SEQUENCE SET; Schema: public; Owner: parent
--

SELECT pg_catalog.setval('public.test_id_historique', 14, true);


--
-- TOC entry 1917 (class 2606 OID 55694)
-- Name: patient Patient_pkey; Type: CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY (id);


--
-- TOC entry 1919 (class 2606 OID 55720)
-- Name: personnel Personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT "Personnel_pkey" PRIMARY KEY (id);


--
-- TOC entry 1915 (class 2606 OID 55689)
-- Name: service Service_pkey; Type: CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (id);


--
-- TOC entry 1921 (class 2606 OID 55735)
-- Name: typerepas TypeRepas_pkey; Type: CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.typerepas
    ADD CONSTRAINT "TypeRepas_pkey" PRIMARY KEY (id);


--
-- TOC entry 1923 (class 2606 OID 56080)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (numero);


--
-- TOC entry 1925 (class 2606 OID 56648)
-- Name: historique historique_pkey; Type: CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT historique_pkey PRIMARY KEY (id);


--
-- TOC entry 1928 (class 2606 OID 56081)
-- Name: commande ce_patient; Type: FK CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT ce_patient FOREIGN KEY (idpatient) REFERENCES public.patient(id);


--
-- TOC entry 1926 (class 2606 OID 55695)
-- Name: patient ce_patient_service; Type: FK CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT ce_patient_service FOREIGN KEY (idservice) REFERENCES public.service(id);


--
-- TOC entry 1931 (class 2606 OID 56649)
-- Name: historique ce_personnel_historique; Type: FK CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT ce_personnel_historique FOREIGN KEY (idpersonnel) REFERENCES public.personnel(id);


--
-- TOC entry 1927 (class 2606 OID 55721)
-- Name: personnel ce_personnel_service; Type: FK CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT ce_personnel_service FOREIGN KEY (idservice) REFERENCES public.service(id);


--
-- TOC entry 1929 (class 2606 OID 56086)
-- Name: commande ce_service; Type: FK CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT ce_service FOREIGN KEY (idservice) REFERENCES public.service(id);


--
-- TOC entry 1930 (class 2606 OID 56091)
-- Name: commande ce_typerepas; Type: FK CONSTRAINT; Schema: public; Owner: parent
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT ce_typerepas FOREIGN KEY (idrepas) REFERENCES public.typerepas(id);


--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-10-22 15:27:57

--
-- PostgreSQL database dump complete
--

