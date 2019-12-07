--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-12-03 09:55:32

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

DROP DATABASE logistics;
--
-- TOC entry 2874 (class 1262 OID 25320)
-- Name: logistics; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE logistics WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Finland.1252' LC_CTYPE = 'English_Finland.1252';


ALTER DATABASE logistics OWNER TO postgres;

\connect logistics

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25322)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customer (
    idcustomer integer NOT NULL,
    custname character varying NOT NULL,
    address character varying,
    city character varying,
    postalcode integer
);


ALTER TABLE customer OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25350)
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE device (
    iddevice integer NOT NULL,
    model character varying(255),
    serialnumber character varying(255),
    mac character varying(255),
    deskey character varying(255),
    wpakey character varying(255),
    productiondate date,
    productionid integer,
    orderid integer
);


ALTER TABLE device OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25358)
-- Name: keyval; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE keyval
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE keyval OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25399)
-- Name: maintenance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE maintenance (
    idmaintenance integer NOT NULL,
    report text NOT NULL,
    rmaid integer
);


ALTER TABLE maintenance OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25736)
-- Name: orderi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orderi (
    idorder integer NOT NULL,
    ordernumber integer NOT NULL,
    orderdate date NOT NULL,
    customerid integer NOT NULL
);


ALTER TABLE orderi OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25734)
-- Name: order_idorder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_idorder_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_idorder_seq OWNER TO postgres;

--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 204
-- Name: order_idorder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_idorder_seq OWNED BY orderi.idorder;


--
-- TOC entry 199 (class 1259 OID 25383)
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE production (
    idproduction integer NOT NULL,
    po character varying(255) NOT NULL,
    productiondate date NOT NULL,
    softwareversion character varying(255) NOT NULL,
    factoryname character varying(255) NOT NULL,
    country character varying(255) NOT NULL
);


ALTER TABLE production OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25696)
-- Name: rma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rma (
    idrma integer NOT NULL,
    issuedescription text NOT NULL,
    rmanumber integer NOT NULL,
    serialnumberid integer NOT NULL
);


ALTER TABLE rma OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25692)
-- Name: rma_idrma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rma_idrma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rma_idrma_seq OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 201
-- Name: rma_idrma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rma_idrma_seq OWNED BY rma.idrma;


--
-- TOC entry 202 (class 1259 OID 25694)
-- Name: rma_rmanumber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rma_rmanumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rma_rmanumber_seq OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 202
-- Name: rma_rmanumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rma_rmanumber_seq OWNED BY rma.rmanumber;


--
-- TOC entry 2718 (class 2604 OID 25739)
-- Name: orderi idorder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderi ALTER COLUMN idorder SET DEFAULT nextval('order_idorder_seq'::regclass);


--
-- TOC entry 2716 (class 2604 OID 25699)
-- Name: rma idrma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rma ALTER COLUMN idrma SET DEFAULT nextval('rma_idrma_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 25700)
-- Name: rma rmanumber; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rma ALTER COLUMN rmanumber SET DEFAULT nextval('rma_rmanumber_seq'::regclass);


--
-- TOC entry 2859 (class 0 OID 25322)
-- Dependencies: 196
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO customer VALUES (4, 'Testi', 'Kauppakatu 18', 'Vaasa', 65100);
INSERT INTO customer VALUES (5, 'Tietotaituri', 'Tekniikkatie 7', 'Oulu', 94780);
INSERT INTO customer VALUES (8, 'Net Man Oy', 'Poratie 7', 'Oulu', 90140);
INSERT INTO customer VALUES (9, 'Nippelitieto', 'Sepäntie 3', 'Mäntsälä', 4600);
INSERT INTO customer VALUES (10, 'ITCT', 'Pohjolankatu 6', 'Kajaani', 87100);
INSERT INTO customer VALUES (1, 'Perämetsän velhot', 'Kauppakatu 10', 'Takajärvi', 62900);
INSERT INTO customer VALUES (2, 'BKC Finland', 'Tiedekatu 2', 'Seinäjoki', 60230);
INSERT INTO customer VALUES (3, 'NGHT', 'Nuijamaankatu 5', 'Savonlinna', 57120);
INSERT INTO customer VALUES (6, 'iLO Ab Oy', 'Yrttipellontie 10', 'Rovajärvi', 90230);
INSERT INTO customer VALUES (7, 'Pimmics Oy', 'Alatie 1', 'Joensuu', 80130);
INSERT INTO customer VALUES (11, 'Testinen', 'Joku osoite', 'En eitä', 12345);


--
-- TOC entry 2860 (class 0 OID 25350)
-- Dependencies: 197
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO device VALUES (11, 'MonsterAC', 'Prefix193005968', 'PPWWRR2ED234', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (12, 'MonsterAC', 'Prefix193006097', 'PPWWRR2ED63C', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (13, 'MonsterAC', 'Prefix193006133', 'PPWWRR2ED75C', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (14, 'MonsterAC', 'Prefix193006286', 'PPWWRR2EDC24', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (15, 'MonsterAC', 'Prefix193006363', 'PPWWRR2EDE8C', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (16, 'MonsterAC', 'Prefix193006406', 'PPWWRR2EDFE4', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (161, 'Moped', 'Prefix161043763', '99:OO:DD:56:3D:C8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (162, 'Moped', 'Prefix161043852', '99:OO:DD:56:40:90', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (163, 'Moped', 'Prefix161044449', '99:OO:DD:56:53:38', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (164, 'Moped', 'Prefix161044479', '99:OO:DD:56:54:28', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (165, 'Moped', 'Prefix161044505', '99:OO:DD:56:54:F8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (166, 'Moped', 'Prefix161043425', '99:OO:DD:56:33:38', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (167, 'Moped', 'Prefix161043471', '99:OO:DD:56:34:A8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (168, 'Moped', 'Prefix161044409', '99:OO:DD:56:51:F8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (169, 'Moped', 'Prefix161044452', '99:OO:DD:56:53:50', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (170, 'Moped', 'Prefix161045279', '99:OO:DD:56:6D:28', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (71, 'MonsterAC', 'Prefix195015572', 'PPWWRR34B1F6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (72, 'MonsterAC', 'Prefix195015568', 'PPWWRR34B1D6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (73, 'MonsterAC', 'Prefix195015478', 'PPWWRR34AF06', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (74, 'MonsterAC', 'Prefix195014541', 'PPWWRR3491BE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (75, 'MonsterAC', 'Prefix195014410', 'PPWWRR348DA6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (87, 'MonsterAC', 'Prefix195014389', 'PPWWRR348CFE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (88, 'MonsterAC', 'Prefix195014377', 'PPWWRR348C9E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (89, 'MonsterAC', 'Prefix195014374', 'PPWWRR348C86', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (90, 'MonsterAC', 'Prefix195014313', 'PPWWRR348A9E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (91, 'MonsterAC', 'Prefix195014977', 'PPWWRR349F5E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (92, 'MonsterAC', 'Prefix195014660', 'PPWWRR349576', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (93, 'MonsterAC', 'Prefix195014637', 'PPWWRR3494BE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (94, 'MonsterAC', 'Prefix195014567', 'PPWWRR34928E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (95, 'MonsterAC', 'Prefix195014556', 'PPWWRR349236', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (96, 'MonsterAC', 'Prefix195014494', 'PPWWRR349046', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (97, 'MonsterAC', 'Prefix195014411', 'PPWWRR348DAE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (98, 'MonsterAC', 'Prefix195014297', 'PPWWRR348A1E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (99, 'MonsterAC', 'Prefix195014282', 'PPWWRR3489A6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (100, 'MonsterAC', 'Prefix195013921', 'PPWWRR347E5E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (101, 'MonsterAC', 'Prefix195015573', 'PPWWRR34B1FE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (102, 'MonsterAC', 'Prefix195015562', 'PPWWRR34B1A6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (103, 'MonsterAC', 'Prefix195015550', 'PPWWRR34B146', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (21, 'Mid-AC', 'Prefix194006133', 'PPWWRR321CB4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (22, 'Mid-AC', 'Prefix194006568', 'PPWWRR322A4C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (23, 'Mid-AC', 'Prefix194006908', 'PPWWRR3234EC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (24, 'Mid-AC', 'Prefix194006916', 'PPWWRR32352C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (25, 'Mid-AC', 'Prefix194007315', 'PPWWRR3241A4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (26, 'Mid-AC', 'Prefix194007710', 'PPWWRR324DFC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (27, 'Mid-AC', 'Prefix194007711', 'PPWWRR324E04', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (28, 'Mid-AC', 'Prefix194007814', 'PPWWRR32513C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (29, 'Mid-AC', 'Prefix194008119', 'PPWWRR325AC4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (2, 'Mid-AC', 'Prefix192023491', 'PPWWRR2D3158', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (3, 'Mid-AC', 'Prefix192023492', 'PPWWRR2D3160', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (4, 'Mid-AC', 'Prefix192023533', 'PPWWRR2D32A8', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (5, 'Mid-AC', 'Prefix192023821', 'PPWWRR2D3BA8', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (6, 'Mid-AC', 'Prefix192023859', 'PPWWRR2D3CD8', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (7, 'Mid-AC', 'Prefix192023894', 'PPWWRR2D3DF0', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (8, 'Mid-AC', 'Prefix192024205', 'PPWWRR2D47A8', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (9, 'Mid-AC', 'Prefix192024471', 'PPWWRR2D4FF8', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (10, 'Mid-AC', 'Prefix192024474', 'PPWWRR2D5010', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (17, 'MonsterAC', 'Prefix193006407', 'PPWWRR2EDFEC', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (76, 'MonsterAC', 'Prefix195014397', 'PPWWRR348D3E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (77, 'MonsterAC', 'Prefix195014371', 'PPWWRR348C6E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (78, 'MonsterAC', 'Prefix195014367', 'PPWWRR348C4E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (79, 'MonsterAC', 'Prefix195014308', 'PPWWRR348A76', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (80, 'MonsterAC', 'Prefix195014303', 'PPWWRR348A4E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (81, 'MonsterAC', 'Prefix195015577', 'PPWWRR34B21E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (82, 'MonsterAC', 'Prefix193019080', 'PPWWRR30AEC4', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (83, 'MonsterAC', 'Prefix195014906', 'PPWWRR349D26', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (84, 'MonsterAC', 'Prefix195014644', 'PPWWRR3494F6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (85, 'MonsterAC', 'Prefix195014568', 'PPWWRR349296', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (121, 'Moped', 'Prefix161044393', '99:OO:DD:56:51:78', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (122, 'Moped', 'Prefix161044451', '99:OO:DD:56:53:48', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (123, 'Moped', 'Prefix161044462', '99:OO:DD:56:53:A0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (124, 'Moped', 'Prefix161044900', '99:OO:DD:56:61:50', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (125, 'Moped', 'Prefix161045007', '99:OO:DD:56:64:A8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (126, 'Moped', 'Prefix161044503', '99:OO:DD:56:54:E8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (127, 'Moped', 'Prefix161044514', '99:OO:DD:56:55:40', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (128, 'Moped', 'Prefix161044547', '99:OO:DD:56:56:48', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (129, 'Moped', 'Prefix161044562', '99:OO:DD:56:56:C0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (130, 'Moped', 'Prefix161044712', '99:OO:DD:56:5B:70', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (18, 'MonsterAC', 'Prefix193006408', 'PPWWRR2EDFF4', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (19, 'MonsterAC', 'Prefix193006412', 'PPWWRR2EE014', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (20, 'MonsterAC', 'Prefix193006512', 'PPWWRR2EE334', '1234567891234567', '235689235689235689', '2019-03-27', 3, 5);
INSERT INTO device VALUES (86, 'MonsterAC', 'Prefix195014515', 'PPWWRR3490EE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (104, 'MonsterAC', 'Prefix195014882', 'PPWWRR349C66', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (105, 'MonsterAC', 'Prefix195014649', 'PPWWRR34951E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (106, 'MonsterAC', 'Prefix195014636', 'PPWWRR3494B6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (107, 'MonsterAC', 'Prefix195014629', 'PPWWRR34947E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (108, 'MonsterAC', 'Prefix195014614', 'PPWWRR349406', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (109, 'MonsterAC', 'Prefix195014599', 'PPWWRR34938E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (110, 'MonsterAC', 'Prefix195014035', 'PPWWRR3481EE', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (111, 'MonsterAC', 'Prefix195015322', 'PPWWRR34AA26', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (112, 'MonsterAC', 'Prefix195014704', 'PPWWRR3496D6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (113, 'MonsterAC', 'Prefix195014651', 'PPWWRR34952E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (114, 'MonsterAC', 'Prefix195014403', 'PPWWRR348D6E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (115, 'MonsterAC', 'Prefix195014322', 'PPWWRR348AE6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (116, 'MonsterAC', 'Prefix195014316', 'PPWWRR348AB6', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (117, 'MonsterAC', 'Prefix195014309', 'PPWWRR348A7E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (118, 'MonsterAC', 'Prefix195014280', 'PPWWRR348996', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (119, 'MonsterAC', 'Prefix195014277', 'PPWWRR34897E', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (120, 'MonsterAC', 'Prefix195014242', 'PPWWRR348866', '1234567891234567', '235689235689235689', '2019-05-21', 1, 2);
INSERT INTO device VALUES (131, 'Moped', 'Prefix161044524', '99:OO:DD:56:55:90', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (132, 'Moped', 'Prefix161044546', '99:OO:DD:56:56:40', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (133, 'Moped', 'Prefix161044554', '99:OO:DD:56:56:80', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (134, 'Moped', 'Prefix161045010', '99:OO:DD:56:64:C0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (135, 'Moped', 'Prefix161045534', '99:OO:DD:56:BD:98', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (136, 'Moped', 'Prefix161044502', '99:OO:DD:56:54:E0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (137, 'Moped', 'Prefix161044532', '99:OO:DD:56:55:D0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (138, 'Moped', 'Prefix161044688', '99:OO:DD:56:5A:B0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (139, 'Moped', 'Prefix161045004', '99:OO:DD:56:64:90', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (140, 'Moped', 'Prefix161045537', '99:OO:DD:56:BD:B0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (141, 'Moped', 'Prefix161044515', '99:OO:DD:56:55:48', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (142, 'Moped', 'Prefix161044517', '99:OO:DD:56:55:58', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (143, 'Moped', 'Prefix161044552', '99:OO:DD:56:56:70', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (144, 'Moped', 'Prefix161044558', '99:OO:DD:56:56:A0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (145, 'Moped', 'Prefix161044559', '99:OO:DD:56:56:A8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (146, 'Moped', 'Prefix161044496', '99:OO:DD:56:54:B0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (147, 'Moped', 'Prefix161044535', '99:OO:DD:56:55:E8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (30, 'Mid-AC', 'Prefix194008439', 'PPWWRR3264C4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (31, 'Mid-AC', 'Prefix194006511', 'PPWWRR322884', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (32, 'Mid-AC', 'Prefix194006545', 'PPWWRR322994', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (33, 'Mid-AC', 'Prefix194006741', 'PPWWRR322FB4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (34, 'Mid-AC', 'Prefix194006873', 'PPWWRR3233D4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (35, 'Mid-AC', 'Prefix194006974', 'PPWWRR3236FC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (36, 'Mid-AC', 'Prefix194007287', 'PPWWRR3240C4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (37, 'Mid-AC', 'Prefix194007325', 'PPWWRR3241F4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (38, 'Mid-AC', 'Prefix194007513', 'PPWWRR3247D4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (39, 'Mid-AC', 'Prefix194007759', 'PPWWRR324F84', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (40, 'Mid-AC', 'Prefix194008292', 'PPWWRR32602C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (1, 'Mid-AC', 'Prefix192023464', 'PPWWRR2D3080', '1234567891234567', '235689235689235689', '2019-03-01', 5, 4);
INSERT INTO device VALUES (148, 'Moped', 'Prefix161044541', '99:OO:DD:56:56:18', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (149, 'Moped', 'Prefix161045535', '99:OO:DD:56:BD:A0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (150, 'Moped', 'Prefix161045536', '99:OO:DD:56:BD:A8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (151, 'Moped', 'Prefix161044400', '99:OO:DD:56:51:B0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (152, 'Moped', 'Prefix161044419', '99:OO:DD:56:52:48', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (153, 'Moped', 'Prefix161044497', '99:OO:DD:56:54:B8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (154, 'Moped', 'Prefix161044530', '99:OO:DD:56:55:C0', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (155, 'Moped', 'Prefix161045533', '99:OO:DD:56:BD:90', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (156, 'Moped', 'Prefix161043639', '99:OO:DD:56:39:E8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (157, 'Moped', 'Prefix161044421', '99:OO:DD:56:52:58', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (158, 'Moped', 'Prefix161044549', '99:OO:DD:56:56:58', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (159, 'Moped', 'Prefix161044994', '99:OO:DD:56:64:40', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (160, 'Moped', 'Prefix161045109', '99:OO:DD:56:67:D8', '1234567891234567', '235689235689235689', '2016-05-10', 4, 1);
INSERT INTO device VALUES (41, 'Mid-AC', 'Prefix194006138', 'PPWWRR321CDC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (42, 'Mid-AC', 'Prefix194006543', 'PPWWRR322984', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (43, 'Mid-AC', 'Prefix194006981', 'PPWWRR323734', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (44, 'Mid-AC', 'Prefix194007028', 'PPWWRR3238AC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (45, 'Mid-AC', 'Prefix194007183', 'PPWWRR323D84', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (46, 'Mid-AC', 'Prefix194007614', 'PPWWRR324AFC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (47, 'Mid-AC', 'Prefix194007705', 'PPWWRR324DD4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (48, 'Mid-AC', 'Prefix194007708', 'PPWWRR324DEC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (49, 'Mid-AC', 'Prefix194007714', 'PPWWRR324E1C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (50, 'Mid-AC', 'Prefix194007801', 'PPWWRR3250D4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (51, 'Mid-AC', 'Prefix194006267', 'PPWWRR3220E4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (52, 'Mid-AC', 'Prefix194006643', 'PPWWRR322CA4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (53, 'Mid-AC', 'Prefix194006799', 'PPWWRR323184', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (54, 'Mid-AC', 'Prefix194006805', 'PPWWRR3231B4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (55, 'Mid-AC', 'Prefix194006904', 'PPWWRR3234CC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (56, 'Mid-AC', 'Prefix194006991', 'PPWWRR323784', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (57, 'Mid-AC', 'Prefix194007026', 'PPWWRR32389C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (58, 'Mid-AC', 'Prefix194007286', 'PPWWRR3240BC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (59, 'Mid-AC', 'Prefix194007768', 'PPWWRR324FCC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (60, 'Mid-AC', 'Prefix194008182', 'PPWWRR325CBC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (61, 'Mid-AC', 'Prefix194006197', 'PPWWRR321EB4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (62, 'Mid-AC', 'Prefix194006540', 'PPWWRR32296C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (63, 'Mid-AC', 'Prefix194006551', 'PPWWRR3229C4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (64, 'Mid-AC', 'Prefix194006670', 'PPWWRR322D7C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (65, 'Mid-AC', 'Prefix194006891', 'PPWWRR323464', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (66, 'Mid-AC', 'Prefix194007202', 'PPWWRR323E1C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (67, 'Mid-AC', 'Prefix194007285', 'PPWWRR3240B4', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (68, 'Mid-AC', 'Prefix194007682', 'PPWWRR324D1C', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (69, 'Mid-AC', 'Prefix194007766', 'PPWWRR324FBC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);
INSERT INTO device VALUES (70, 'Mid-AC', 'Prefix194008122', 'PPWWRR325ADC', '1234567891234567', '235689235689235689', '2019-04-22', 2, 3);


--
-- TOC entry 2863 (class 0 OID 25399)
-- Dependencies: 200
-- Data for Name: maintenance; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO maintenance VALUES (1, 'Ei ollut mitään vikaa. Ilmeisesti unohdettu lukea manuaali', 1);
INSERT INTO maintenance VALUES (2, 'Huoltoon ei lähetetty alkuperäistä virtalähdettä. Testattu toimivalla virtalähteellä -- OK. Palautetaan', 3);
INSERT INTO maintenance VALUES (3, 'Laite ei enää takuun alainen', 2);
INSERT INTO maintenance VALUES (4, 'Käyttäjä sammuttanut radiot WiFi on/off painikkeesta. Toimii. Palautetaan.', 4);
INSERT INTO maintenance VALUES (5, 'Wifi ei toimi. Uusi laite tilalle.', 5);
INSERT INTO maintenance VALUES (6, 'Rooomuuuu', 4);


--
-- TOC entry 2868 (class 0 OID 25736)
-- Dependencies: 205
-- Data for Name: orderi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO orderi VALUES (1, 12345, '2016-05-10', 1);
INSERT INTO orderi VALUES (2, 554477, '2017-10-10', 1);
INSERT INTO orderi VALUES (3, 445577, '2017-10-15', 2);
INSERT INTO orderi VALUES (4, 12346, '2018-05-09', 3);
INSERT INTO orderi VALUES (5, 1234567, '2019-01-01', 4);
INSERT INTO orderi VALUES (6, 99988, '2019-01-02', 5);
INSERT INTO orderi VALUES (7, 1234650, '2019-01-03', 5);
INSERT INTO orderi VALUES (8, 2255, '2019-01-04', 6);
INSERT INTO orderi VALUES (9, 114477, '2019-01-05', 6);
INSERT INTO orderi VALUES (10, 99887766, '2019-01-06', 10);


--
-- TOC entry 2862 (class 0 OID 25383)
-- Dependencies: 199
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO production VALUES (1, '80013', '2019-05-21', 'Monster-Info-FW-P3-190102.y3', 'Alterbox', 'China');
INSERT INTO production VALUES (2, '80099
', '2019-04-22', 'Mid-IfnoFW-P3-190505.y3', 'Alterbox', 'China');
INSERT INTO production VALUES (3, '80056', '2019-03-27', 'Monster-Info-FW-P3-190102.y3', 'Alterbox', 'China');
INSERT INTO production VALUES (4, '80078', '2016-05-10', 'Moped-Info-FW-150519', 'Alterbox', 'China');
INSERT INTO production VALUES (5, '80077', '2019-03-01', 'Mid-IfnoFW-P3-190505.y3', 'Alterbox', 'China');
INSERT INTO production VALUES (6, '80079', '2019-03-02', 'Mid-IfnoFW-P3-190505.y3', 'Tatattaa', 'India');
INSERT INTO production VALUES (7, '80080', '2019-03-03', 'Mid-IfnoFW-P3-190505.y3', 'Alterbox', 'China');
INSERT INTO production VALUES (8, '80073', '2019-03-04', 'Mid-IfnoFW-P3-190505.y3', 'Alterbox', 'India');


--
-- TOC entry 2866 (class 0 OID 25696)
-- Dependencies: 203
-- Data for Name: rma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rma VALUES (1, 'Ei toimi. Rikki', 1001, 68);
INSERT INTO rma VALUES (2, 'Romu', 1002, 69);
INSERT INTO rma VALUES (3, 'Ei käynnisty', 1003, 70);
INSERT INTO rma VALUES (4, 'Ei toimi', 1003, 78);
INSERT INTO rma VALUES (5, 'WiFi ei toimi', 1004, 90);
INSERT INTO rma VALUES (12, 'Hajalla', 1005, 11);
INSERT INTO rma VALUES (13, 'Romux', 1006, 164);
INSERT INTO rma VALUES (14, 'Jotain jotain', 1007, 167);
INSERT INTO rma VALUES (15, 'Vikaa On ihan wurstisti', 1008, 167);


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 198
-- Name: keyval; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('keyval', 1, false);


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 204
-- Name: order_idorder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_idorder_seq', 10, true);


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 201
-- Name: rma_idrma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rma_idrma_seq', 15, true);


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 202
-- Name: rma_rmanumber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rma_rmanumber_seq', 1, false);


--
-- TOC entry 2720 (class 2606 OID 25329)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (idcustomer);


--
-- TOC entry 2722 (class 2606 OID 25357)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY device
    ADD CONSTRAINT device_pkey PRIMARY KEY (iddevice);


--
-- TOC entry 2729 (class 2606 OID 25406)
-- Name: maintenance maintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY maintenance
    ADD CONSTRAINT maintenance_pkey PRIMARY KEY (idmaintenance);


--
-- TOC entry 2734 (class 2606 OID 25741)
-- Name: orderi order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderi
    ADD CONSTRAINT order_pkey PRIMARY KEY (idorder);


--
-- TOC entry 2726 (class 2606 OID 25390)
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY production
    ADD CONSTRAINT production_pkey PRIMARY KEY (idproduction);


--
-- TOC entry 2731 (class 2606 OID 25705)
-- Name: rma rma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rma
    ADD CONSTRAINT rma_pkey PRIMARY KEY (idrma);


--
-- TOC entry 2732 (class 1259 OID 25747)
-- Name: fki_fk_customer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_customer ON orderi USING btree (customerid);


--
-- TOC entry 2723 (class 1259 OID 25499)
-- Name: fki_fk_orderid_device; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_orderid_device ON device USING btree (orderid);


--
-- TOC entry 2724 (class 1259 OID 25492)
-- Name: fki_fk_production; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_production ON device USING btree (productionid);


--
-- TOC entry 2727 (class 1259 OID 25463)
-- Name: fki_fk_rmaid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_rmaid ON maintenance USING btree (rmaid);


--
-- TOC entry 2737 (class 2606 OID 25742)
-- Name: orderi fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderi
    ADD CONSTRAINT fk_customer FOREIGN KEY (customerid) REFERENCES customer(idcustomer);


--
-- TOC entry 2735 (class 2606 OID 25487)
-- Name: device fk_production; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY device
    ADD CONSTRAINT fk_production FOREIGN KEY (productionid) REFERENCES production(idproduction);


--
-- TOC entry 2736 (class 2606 OID 25726)
-- Name: maintenance maintenance_rmaid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY maintenance
    ADD CONSTRAINT maintenance_rmaid_fkey FOREIGN KEY (rmaid) REFERENCES rma(idrma);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE customer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE customer TO warehouse;


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE device; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE device TO warehouse;


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 198
-- Name: SEQUENCE keyval; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE keyval TO warehouse;


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE maintenance; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE maintenance TO warehouse;


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE orderi; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE orderi TO warehouse;


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 204
-- Name: SEQUENCE order_idorder_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE order_idorder_seq TO warehouse;


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE production; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE production TO warehouse;


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE rma; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE rma TO warehouse;


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 201
-- Name: SEQUENCE rma_idrma_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE rma_idrma_seq TO warehouse;


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 202
-- Name: SEQUENCE rma_rmanumber_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE rma_rmanumber_seq TO warehouse;


-- Completed on 2019-12-03 09:55:32

--
-- PostgreSQL database dump complete
--

