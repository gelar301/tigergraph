--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-07-20 10:54:08 +07

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
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16395)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    "userId" uuid NOT NULL,
    token text NOT NULL,
    "expiredTime" bigint NOT NULL,
    "createdOn" bigint NOT NULL
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.password_reset_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 216
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- TOC entry 217 (class 1259 OID 16401)
-- Name: pgmigrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pgmigrations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    run_on timestamp without time zone NOT NULL
);


ALTER TABLE public.pgmigrations OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: pgmigrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pgmigrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pgmigrations_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 218
-- Name: pgmigrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pgmigrations_id_seq OWNED BY public.pgmigrations.id;


--
-- TOC entry 219 (class 1259 OID 16405)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying NOT NULL,
    "firstName" character varying DEFAULT ''::character varying,
    "lastName" character varying DEFAULT ''::character varying,
    phone character varying DEFAULT ''::character varying,
    role character varying NOT NULL,
    active boolean NOT NULL,
    "languageCode" character varying,
    timezone character varying,
    "deactivatedOn" bigint,
    "deactivatedBy" character varying,
    "profilePictureSet" boolean,
    "createdOn" bigint NOT NULL,
    "lastUpdatedOn" bigint,
    "createdBy" character varying,
    "lastUpdatedBy" character varying,
    "profilePictureBlob" bytea,
    "profilePictureFileName" character varying,
    "profilePictureMimeType" character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3216 (class 2604 OID 16414)
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 16415)
-- Name: pgmigrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pgmigrations ALTER COLUMN id SET DEFAULT nextval('public.pgmigrations_id_seq'::regclass);


--
-- TOC entry 3373 (class 0 OID 16395)
-- Dependencies: 215
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3375 (class 0 OID 16401)
-- Dependencies: 217
-- Data for Name: pgmigrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pgmigrations VALUES (1, '1677944881013_add-user-table', '2023-06-28 11:07:24.241255');
INSERT INTO public.pgmigrations VALUES (2, '1678244469390_add-forgot-password-reset-token-table', '2023-06-28 11:07:24.241255');
INSERT INTO public.pgmigrations VALUES (3, '1689733535713_rename-email-to-username', '2023-07-19 03:32:21.726876');


--
-- TOC entry 3377 (class 0 OID 16405)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (public.uuid_generate_v4(), 'graphdb_sac', 'graphdb_sac', 'Signer', '', 'Signer', true, NULL, NULL, NULL, NULL, NULL, 1688992946, 1688992946, '6921d47d-4eba-45e5-8372-6053ca01ff46', '6921d47d-4eba-45e5-8372-6053ca01ff46', NULL, NULL, NULL);
INSERT INTO public.users VALUES (public.uuid_generate_v4(), 'cdh-graphdb', 'cdh-graphdb', 'Checker', '', 'Checker', true, NULL, NULL, NULL, NULL, NULL, 1688992946, 1688992946, '6921d47d-4eba-45e5-8372-6053ca01ff46', '6921d47d-4eba-45e5-8372-6053ca01ff46', NULL, NULL, NULL);
INSERT INTO public.users VALUES (public.uuid_generate_v4(), '00287993', '00287993', 'Maker', '', 'Maker', true, NULL, NULL, NULL, NULL, NULL, 1688992946, 1688992946, '6921d47d-4eba-45e5-8372-6053ca01ff46', '6921d47d-4eba-45e5-8372-6053ca01ff46', NULL, NULL, NULL);

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 216
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 1, false);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 218
-- Name: pgmigrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pgmigrations_id_seq', 3, true);


--
-- TOC entry 3223 (class 2606 OID 16417)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16419)
-- Name: pgmigrations pgmigrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pgmigrations
    ADD CONSTRAINT pgmigrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 16421)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 24622)
-- Name: users users_uniqueUsername; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_uniqueUsername" UNIQUE (username);


--
-- TOC entry 3230 (class 2606 OID 16424)
-- Name: password_reset_tokens password_reset_tokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT "password_reset_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-07-20 10:54:11 +07

--
-- PostgreSQL database dump complete
--

