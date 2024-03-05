--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: mst_bom_hdrs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mst_bom_hdrs (
    id bigint NOT NULL,
    plant character varying(4) NOT NULL,
    work_center character varying(10) NOT NULL,
    sfg_code character varying(40) NOT NULL,
    sfg_desc character varying(40) NOT NULL,
    sfg_uom character varying(3) NOT NULL,
    bom_type character varying(10),
    base_qty integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    alt_bom_no character varying
);


--
-- Name: mst_bom_hdrs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mst_bom_hdrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mst_bom_hdrs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mst_bom_hdrs_id_seq OWNED BY public.mst_bom_hdrs.id;


--
-- Name: mst_materials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mst_materials (
    id bigint NOT NULL,
    mat_type character varying(40),
    mat_group character varying(40),
    mat_code character varying(40),
    mat_desc character varying(40),
    mat_uom character varying(5),
    plant character varying(10),
    str_loc character varying(40),
    prod_str_loc character varying(40),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: mst_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mst_materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mst_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mst_materials_id_seq OWNED BY public.mst_materials.id;


--
-- Name: mst_plants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mst_plants (
    id bigint NOT NULL,
    plant character varying(4) NOT NULL,
    plant_name character varying(30) NOT NULL,
    status character varying(1) DEFAULT 'A'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: mst_plants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mst_plants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mst_plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mst_plants_id_seq OWNED BY public.mst_plants.id;


--
-- Name: prod_plan_headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prod_plan_headers (
    id bigint NOT NULL,
    plant character varying(4) NOT NULL,
    work_center character varying(10) NOT NULL,
    sfg_code character varying(40) NOT NULL,
    sfg_desc character varying(40) NOT NULL,
    sfg_uom character varying(3) NOT NULL,
    trt_code character varying(40) NOT NULL,
    day_req_qty_m2 numeric(12,3),
    re_order_point numeric(12,3),
    max_stock numeric(12,3),
    safety_stock numeric(12,3),
    stock_qty numeric(12,3),
    sfg_plan_qty numeric(12,3),
    sfg_sequence character varying(3),
    bom_type character varying(10),
    po_type character varying(10),
    schedule_no character varying(10) NOT NULL,
    schedule_status character varying(10) NOT NULL,
    action_status character varying DEFAULT 'open'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    part_no character varying
);


--
-- Name: prod_plan_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prod_plan_headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prod_plan_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prod_plan_headers_id_seq OWNED BY public.prod_plan_headers.id;


--
-- Name: prod_plan_masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prod_plan_masters (
    id bigint NOT NULL,
    plant character varying(4) NOT NULL,
    work_center character varying(10) NOT NULL,
    re_order_per integer,
    no_of_hrs integer,
    sfg_code character varying NOT NULL,
    sfg_desc character varying(50) NOT NULL,
    day_req_batch integer,
    kanban_size integer,
    day_req_kanban integer,
    frequency_day integer,
    lot_size integer,
    safety_stock integer,
    max_stock integer,
    re_order_point integer,
    uom character varying(3),
    action_status character varying DEFAULT 'open'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    part_no character varying
);


--
-- Name: prod_plan_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prod_plan_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prod_plan_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prod_plan_masters_id_seq OWNED BY public.prod_plan_masters.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: trn_planned_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trn_planned_orders (
    id bigint NOT NULL,
    plant character varying(4) NOT NULL,
    plan_order_no character varying(10) NOT NULL,
    plan_order_dt date,
    work_center character varying(10) NOT NULL,
    sfg_code character varying(40) NOT NULL,
    sfg_desc character varying(40) NOT NULL,
    sfg_uom character varying(3) NOT NULL,
    sfg_qty integer,
    alt_bom_no character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trn_planned_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trn_planned_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trn_planned_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trn_planned_orders_id_seq OWNED BY public.trn_planned_orders.id;


--
-- Name: trn_prod_plan_headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trn_prod_plan_headers (
    id bigint NOT NULL,
    plant character varying(4) NOT NULL,
    plan_order_no character varying(30),
    work_center character varying(10) NOT NULL,
    sfg_code character varying(40) NOT NULL,
    sfg_desc character varying(40) NOT NULL,
    sfg_uom character varying(3) NOT NULL,
    trt_code character varying(40) NOT NULL,
    day_req_qty_m2 numeric(12,3),
    re_order_point numeric(12,3),
    max_stock numeric(12,3),
    safety_stock numeric(12,3),
    stock_qty numeric(12,3),
    sfg_plan_qty numeric(12,3),
    sfg_sequence character varying(3),
    bom_type character varying(10),
    po_type character varying(10),
    schedule_no character varying(10) NOT NULL,
    schedule_status character varying(10) NOT NULL,
    action_status character varying DEFAULT 'open'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    sap_plan_order character varying,
    alt_bom_no character varying,
    plan_order_dt date
);


--
-- Name: trn_prod_plan_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trn_prod_plan_headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trn_prod_plan_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trn_prod_plan_headers_id_seq OWNED BY public.trn_prod_plan_headers.id;


--
-- Name: trn_prod_plan_masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trn_prod_plan_masters (
    id bigint NOT NULL,
    trt_code character varying NOT NULL,
    trt_width numeric(7,2),
    plant character varying(4) NOT NULL,
    work_center character varying(10) NOT NULL,
    re_order_per integer,
    no_of_hrs integer,
    sfg_code character varying(16) NOT NULL,
    sfg_desc character varying(50) NOT NULL,
    day_req_batch integer,
    kanban_size integer,
    day_req_kanban integer,
    frequency_day integer,
    lot_size integer,
    safety_stock integer,
    max_stock integer,
    re_order_point integer,
    uom character varying(3),
    action_status character varying DEFAULT 'open'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trn_prod_plan_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trn_prod_plan_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trn_prod_plan_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trn_prod_plan_masters_id_seq OWNED BY public.trn_prod_plan_masters.id;


--
-- Name: trt_msts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trt_msts (
    id bigint NOT NULL,
    trt_code character varying(40),
    part_no character varying(10),
    sfg_code character varying(40),
    sfg_desc character varying(40),
    fabric_code character varying(40),
    fabric_desc character varying(40),
    comp_code character varying(40),
    comp_desc character varying(40),
    vendor_code character varying(10),
    vendor_name character varying(50),
    bom_no integer,
    trt_identification character varying(30),
    trt_status character varying(1),
    user_id character varying(7),
    device_id character varying(20),
    status character varying(1),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    gauge numeric(3,2)
);


--
-- Name: trt_msts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trt_msts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trt_msts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trt_msts_id_seq OWNED BY public.trt_msts.id;


--
-- Name: mst_bom_hdrs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mst_bom_hdrs ALTER COLUMN id SET DEFAULT nextval('public.mst_bom_hdrs_id_seq'::regclass);


--
-- Name: mst_materials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mst_materials ALTER COLUMN id SET DEFAULT nextval('public.mst_materials_id_seq'::regclass);


--
-- Name: mst_plants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mst_plants ALTER COLUMN id SET DEFAULT nextval('public.mst_plants_id_seq'::regclass);


--
-- Name: prod_plan_headers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prod_plan_headers ALTER COLUMN id SET DEFAULT nextval('public.prod_plan_headers_id_seq'::regclass);


--
-- Name: prod_plan_masters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prod_plan_masters ALTER COLUMN id SET DEFAULT nextval('public.prod_plan_masters_id_seq'::regclass);


--
-- Name: trn_planned_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trn_planned_orders ALTER COLUMN id SET DEFAULT nextval('public.trn_planned_orders_id_seq'::regclass);


--
-- Name: trn_prod_plan_headers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trn_prod_plan_headers ALTER COLUMN id SET DEFAULT nextval('public.trn_prod_plan_headers_id_seq'::regclass);


--
-- Name: trn_prod_plan_masters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trn_prod_plan_masters ALTER COLUMN id SET DEFAULT nextval('public.trn_prod_plan_masters_id_seq'::regclass);


--
-- Name: trt_msts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trt_msts ALTER COLUMN id SET DEFAULT nextval('public.trt_msts_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-10-22 06:25:14.577501	2019-10-22 06:25:14.577501
\.


--
-- Data for Name: mst_bom_hdrs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mst_bom_hdrs (id, plant, work_center, sfg_code, sfg_desc, sfg_uom, bom_type, base_qty, created_at, updated_at, alt_bom_no) FROM stdin;
2	1080	ACAL720	2N06280302096A	2N06280302096A	M2	W	0	2019-11-21 00:00:00	2019-11-21 00:00:00	01
\.


--
-- Data for Name: mst_materials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mst_materials (id, mat_type, mat_group, mat_code, mat_desc, mat_uom, plant, str_loc, prod_str_loc, created_at, updated_at) FROM stdin;
9	ZROH	9	14110101120101A	NYLON6 N14 840/2	KG	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
10	ZROH	9	14110101120101A	NYLON6 N14 840/2	KG	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
11	ZROH	9	14110101250500A	NYLON6 N25 1260/2	KG	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
12	ZSFG	102	201A3424	3424 FB	KG	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
13	ZSFG	102	201A3440	3440 FB	KG	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
14	ZSFG	102	201A3903	3903 FB	KG	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
15	ZSFG	104	2N06140110089A	NYLON6 N14 840/2 3903 0.89	M2	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
16	ZSFG	104	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	M2	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
17	ZSFG	104	2N06280302096A	NYLON6 N25 1260/2 3424 0.96	M2	1080	M072	M072	2015-12-31 23:59:59	2015-12-31 23:59:59
\.


--
-- Data for Name: mst_plants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mst_plants (id, plant, plant_name, status, created_at, updated_at) FROM stdin;
14	1001	2N3838231	A	2019-10-24 07:27:14.427718	2019-10-24 07:27:14.427718
15	1002	2N3838350	A	2019-10-24 07:27:14.432175	2019-10-24 07:27:14.432175
16	1003	2N3838360	I	2019-10-24 07:27:14.435783	2019-10-24 07:27:14.435783
17	1004	2N3838381	A	2019-10-24 07:27:14.439059	2019-10-24 07:27:14.439059
18	1005	2N3838390	I	2019-10-24 07:27:14.44269	2019-10-24 07:27:14.44269
19	1006	2N3838790	A	2019-10-24 07:27:14.446678	2019-10-24 07:27:14.446678
20	1007	2N3838385	I	2019-10-24 07:27:14.450356	2019-10-24 07:27:14.450356
\.


--
-- Data for Name: prod_plan_headers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prod_plan_headers (id, plant, work_center, sfg_code, sfg_desc, sfg_uom, trt_code, day_req_qty_m2, re_order_point, max_stock, safety_stock, stock_qty, sfg_plan_qty, sfg_sequence, bom_type, po_type, schedule_no, schedule_status, action_status, created_at, updated_at, part_no) FROM stdin;
\.


--
-- Data for Name: prod_plan_masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prod_plan_masters (id, plant, work_center, re_order_per, no_of_hrs, sfg_code, sfg_desc, day_req_batch, kanban_size, day_req_kanban, frequency_day, lot_size, safety_stock, max_stock, re_order_point, uom, action_status, created_at, updated_at, part_no) FROM stdin;
162	1080	MCH-1001	20	5	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	277	1	277	11	25	58	83	290	M2	Active	2019-11-21 05:40:44.78593	2019-11-21 05:40:44.78593	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20191022062920
20191022064937
20191024070917
20191024182634
20191024184414
20191024194017
20191024194204
20191024194723
20191029105235
20191119001007
20191121054304
20191121054305
20191121054306
20191122071048
20191122071101
\.


--
-- Data for Name: trn_planned_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.trn_planned_orders (id, plant, plan_order_no, plan_order_dt, work_center, sfg_code, sfg_desc, sfg_uom, sfg_qty, alt_bom_no, created_at, updated_at) FROM stdin;
1	1080	0048421723	2019-11-25	ACAL720	2N06280302096A	2N06280302096A	M2	10000	01	2019-11-21 00:00:00	2019-11-21 00:00:00
\.


--
-- Data for Name: trn_prod_plan_headers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.trn_prod_plan_headers (id, plant, plan_order_no, work_center, sfg_code, sfg_desc, sfg_uom, trt_code, day_req_qty_m2, re_order_point, max_stock, safety_stock, stock_qty, sfg_plan_qty, sfg_sequence, bom_type, po_type, schedule_no, schedule_status, action_status, created_at, updated_at, sap_plan_order, alt_bom_no, plan_order_dt) FROM stdin;
\.


--
-- Data for Name: trn_prod_plan_masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.trn_prod_plan_masters (id, trt_code, trt_width, plant, work_center, re_order_per, no_of_hrs, sfg_code, sfg_desc, day_req_batch, kanban_size, day_req_kanban, frequency_day, lot_size, safety_stock, max_stock, re_order_point, uom, action_status, created_at, updated_at) FROM stdin;
17	20400444	\N	1080	MCH-1001	20	5	2N06280302096A	NYLON6 N25 1260/2 3424 0.96	300	1	300	1	300	63	363	3780	M2	Active	2019-11-25 04:33:19.585587	2019-11-25 04:33:19.585587
19	20400176	\N	1080	MCH-1001	20	5	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	3	3	1	3	0	0	0	0	M2	Active	2019-11-25 04:35:06.815486	2019-11-25 04:35:06.815486
18	20400468	\N	1080	MCH-1001	20	5	2N06140110089A	NYLON6 N14 840/2 3903 0.89	2	2	1	2	1	0	1	0	M2	Active	2019-11-25 04:34:50.317353	2019-11-25 04:34:50.317353
\.


--
-- Data for Name: trt_msts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.trt_msts (id, trt_code, part_no, sfg_code, sfg_desc, fabric_code, fabric_desc, comp_code, comp_desc, vendor_code, vendor_name, bom_no, trt_identification, trt_status, user_id, device_id, status, created_at, updated_at, gauge) FROM stdin;
10	20400468	\N	2N06140110089A	NYLON6 N14 840/2 3903 0.89	14110101120101A	NYLON6N14840/2	201A3903	3903 FB	7100001425	SRF LIMITED.	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	0.89
11	20400174	\N	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	14110101220200B	NYLON6N201260/2	201A3440	3440 FB	7200000028	PT PRIMA SENTRA MEGAH	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	1.02
12	20400176	\N	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	14110101220200B	NYLON6N201260/2	201A3440	3440 FB	7100001425	SRF LIMITED.	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	1.02
13	20400325	\N	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	14110101220200B	NYLON6N201260/2	201A3440	3440 FB	7100000850	MADURA INDUSTRIAL TEXTILES	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	1.02
14	20400377	\N	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	14110101220200B	NYLON6N201260/2	201A3440	3440 FB	7200000027	HUAIAN NYLON CHEMICAL FIBRE CO. LT	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	1.02
15	20400451	\N	2N06200303102A	NYLON6 N20 1260/2 3440 1.02	14110101220200B	NYLON6N201260/2	201A3440	3440 FB	7200000090	JIANGSU HAIYANG CHEMICAL FIBRES CO.	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	1.02
16	20400384	\N	2N06280302096A	NYLON6 N25 1260/2 3424 0.96	14110101250500A	NYLON6N251260/2	201A3424	3424 FB	7100001425	SRF LIMITED. 2 GREEN 2 VIOLET	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	0.96
17	20400444	\N	2N06280302096A	NYLON6 N25 1260/2 3424 0.96	14110101250500A	NYLON6N251260/2	201A3424	3424 FB	7200000028	PT PRIMA SENTRA MEGAH 2 GREEN 2 VIOLET	\N		\N	\N	\N	\N	2015-12-31 23:59:59	2015-12-31 23:59:59	0.96
\.


--
-- Name: mst_bom_hdrs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mst_bom_hdrs_id_seq', 2, true);


--
-- Name: mst_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mst_materials_id_seq', 17, true);


--
-- Name: mst_plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mst_plants_id_seq', 20, true);


--
-- Name: prod_plan_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prod_plan_headers_id_seq', 65, true);


--
-- Name: prod_plan_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prod_plan_masters_id_seq', 162, true);


--
-- Name: trn_planned_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trn_planned_orders_id_seq', 1, true);


--
-- Name: trn_prod_plan_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trn_prod_plan_headers_id_seq', 43, true);


--
-- Name: trn_prod_plan_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trn_prod_plan_masters_id_seq', 19, true);


--
-- Name: trt_msts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trt_msts_id_seq', 17, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: mst_bom_hdrs mst_bom_hdrs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mst_bom_hdrs
    ADD CONSTRAINT mst_bom_hdrs_pkey PRIMARY KEY (id);


--
-- Name: mst_materials mst_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mst_materials
    ADD CONSTRAINT mst_materials_pkey PRIMARY KEY (id);


--
-- Name: mst_plants mst_plants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mst_plants
    ADD CONSTRAINT mst_plants_pkey PRIMARY KEY (id);


--
-- Name: prod_plan_headers prod_plan_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prod_plan_headers
    ADD CONSTRAINT prod_plan_headers_pkey PRIMARY KEY (id);


--
-- Name: prod_plan_masters prod_plan_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prod_plan_masters
    ADD CONSTRAINT prod_plan_masters_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: trn_planned_orders trn_planned_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trn_planned_orders
    ADD CONSTRAINT trn_planned_orders_pkey PRIMARY KEY (id);


--
-- Name: trn_prod_plan_headers trn_prod_plan_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trn_prod_plan_headers
    ADD CONSTRAINT trn_prod_plan_headers_pkey PRIMARY KEY (id);


--
-- Name: trn_prod_plan_masters trn_prod_plan_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trn_prod_plan_masters
    ADD CONSTRAINT trn_prod_plan_masters_pkey PRIMARY KEY (id);


--
-- Name: trt_msts trt_msts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trt_msts
    ADD CONSTRAINT trt_msts_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

