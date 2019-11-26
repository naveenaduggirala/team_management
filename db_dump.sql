--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11 (Ubuntu 10.11-1.pgdg16.04+1)
-- Dumped by pg_dump version 10.11 (Ubuntu 10.11-1.pgdg16.04+1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO dhanush;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO dhanush;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO dhanush;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO dhanush;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO dhanush;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO dhanush;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO dhanush;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO dhanush;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO dhanush;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO dhanush;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO dhanush;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO dhanush;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO dhanush;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO dhanush;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO dhanush;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO dhanush;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO dhanush;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO dhanush;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO dhanush;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO dhanush;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO dhanush;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO dhanush;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: team_matches; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.team_matches (
    id integer NOT NULL,
    contestant1_id integer NOT NULL,
    contestant2_id integer NOT NULL
);


ALTER TABLE public.team_matches OWNER TO dhanush;

--
-- Name: team_matches_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.team_matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_matches_id_seq OWNER TO dhanush;

--
-- Name: team_matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.team_matches_id_seq OWNED BY public.team_matches.id;


--
-- Name: team_player; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.team_player (
    id integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100),
    image character varying(100),
    player_jersey_no character varying(100) NOT NULL,
    country character varying(100),
    player_team_id integer
);


ALTER TABLE public.team_player OWNER TO dhanush;

--
-- Name: team_player_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.team_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_player_id_seq OWNER TO dhanush;

--
-- Name: team_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.team_player_id_seq OWNED BY public.team_player.id;


--
-- Name: team_playerhistory; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.team_playerhistory (
    id integer NOT NULL,
    no_matches character varying(100),
    no_runs character varying(100),
    highest_scores character varying(100),
    no_fifties character varying(100),
    no_hundreds character varying(100),
    player_id integer
);


ALTER TABLE public.team_playerhistory OWNER TO dhanush;

--
-- Name: team_playerhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.team_playerhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_playerhistory_id_seq OWNER TO dhanush;

--
-- Name: team_playerhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.team_playerhistory_id_seq OWNED BY public.team_playerhistory.id;


--
-- Name: team_points; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.team_points (
    id integer NOT NULL,
    winner character varying(100),
    contestant1_points character varying(100),
    contestant2_points character varying(100),
    match_id integer NOT NULL
);


ALTER TABLE public.team_points OWNER TO dhanush;

--
-- Name: team_points_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.team_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_points_id_seq OWNER TO dhanush;

--
-- Name: team_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.team_points_id_seq OWNED BY public.team_points.id;


--
-- Name: team_team; Type: TABLE; Schema: public; Owner: dhanush
--

CREATE TABLE public.team_team (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    logo character varying(100),
    club_state character varying(100)
);


ALTER TABLE public.team_team OWNER TO dhanush;

--
-- Name: team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: dhanush
--

CREATE SEQUENCE public.team_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_team_id_seq OWNER TO dhanush;

--
-- Name: team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhanush
--

ALTER SEQUENCE public.team_team_id_seq OWNED BY public.team_team.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: team_matches id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_matches ALTER COLUMN id SET DEFAULT nextval('public.team_matches_id_seq'::regclass);


--
-- Name: team_player id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_player ALTER COLUMN id SET DEFAULT nextval('public.team_player_id_seq'::regclass);


--
-- Name: team_playerhistory id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_playerhistory ALTER COLUMN id SET DEFAULT nextval('public.team_playerhistory_id_seq'::regclass);


--
-- Name: team_points id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_points ALTER COLUMN id SET DEFAULT nextval('public.team_points_id_seq'::regclass);


--
-- Name: team_team id; Type: DEFAULT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_team ALTER COLUMN id SET DEFAULT nextval('public.team_team_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add Token	8	add_token
23	Can change Token	8	change_token
24	Can delete Token	8	delete_token
25	Can add points	9	add_points
26	Can change points	9	change_points
27	Can delete points	9	delete_points
28	Can add matches	10	add_matches
29	Can change matches	10	change_matches
30	Can delete matches	10	delete_matches
31	Can add player	11	add_player
32	Can change player	11	change_player
33	Can delete player	11	delete_player
34	Can add player history	12	add_playerhistory
35	Can change player history	12	change_playerhistory
36	Can delete player history	12	delete_playerhistory
37	Can add team	13	add_team
38	Can change team	13	change_team
39	Can delete team	13	delete_team
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	authtoken	token
9	team	points
10	team	matches
11	team	player
12	team	playerhistory
13	team	team
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-26 18:17:05.089545+05:30
2	auth	0001_initial	2019-11-26 18:17:06.161329+05:30
3	admin	0001_initial	2019-11-26 18:17:06.415556+05:30
4	admin	0002_logentry_remove_auto_add	2019-11-26 18:17:06.466062+05:30
5	contenttypes	0002_remove_content_type_name	2019-11-26 18:17:06.537359+05:30
6	auth	0002_alter_permission_name_max_length	2019-11-26 18:17:06.567586+05:30
7	auth	0003_alter_user_email_max_length	2019-11-26 18:17:06.59794+05:30
8	auth	0004_alter_user_username_opts	2019-11-26 18:17:06.621466+05:30
9	auth	0005_alter_user_last_login_null	2019-11-26 18:17:06.64895+05:30
10	auth	0006_require_contenttypes_0002	2019-11-26 18:17:06.659164+05:30
11	auth	0007_alter_validators_add_error_messages	2019-11-26 18:17:06.688118+05:30
12	auth	0008_alter_user_username_max_length	2019-11-26 18:17:06.782242+05:30
13	authtoken	0001_initial	2019-11-26 18:17:06.954867+05:30
14	authtoken	0002_auto_20160226_1747	2019-11-26 18:17:07.107782+05:30
15	sessions	0001_initial	2019-11-26 18:17:07.311635+05:30
16	sites	0001_initial	2019-11-26 18:17:07.382768+05:30
17	sites	0002_alter_domain_unique	2019-11-26 18:17:07.484528+05:30
18	team	0001_initial	2019-11-26 18:17:08.289324+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: team_matches; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.team_matches (id, contestant1_id, contestant2_id) FROM stdin;
1	1	2
2	3	4
\.


--
-- Data for Name: team_player; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.team_player (id, firstname, lastname, image, player_jersey_no, country, player_team_id) FROM stdin;
1	na	d	Player/Screenshot_982.png	01	india	4
2	roopa	e	Player/Screenshot_981.png	02	india	4
3	jhansi 	g	Player/Screenshot_987.png	03	india	1
4	avinash	g	Player/Screenshot_981_O1HKgnm.png	04	india	1
5	chaitanya	d	Player/Screenshot_981_qThxVsZ.png	05	india	2
7	anjana	s	Player/Screenshot_981_LtAuanW.png	06	india	2
8	mounica	s	Player/Screenshot_981_SAs4rIG.png	07	india	2
\.


--
-- Data for Name: team_playerhistory; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.team_playerhistory (id, no_matches, no_runs, highest_scores, no_fifties, no_hundreds, player_id) FROM stdin;
\.


--
-- Data for Name: team_points; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.team_points (id, winner, contestant1_points, contestant2_points, match_id) FROM stdin;
\.


--
-- Data for Name: team_team; Type: TABLE DATA; Schema: public; Owner: dhanush
--

COPY public.team_team (id, name, logo, club_state) FROM stdin;
1	mumbai indians	Team/download.jpeg	mumbai
2	chennai super kings	Team/Screenshot_0.png	chennai
3	rajasthan royals	Team/Screenshot_984.png	rajasthan
4	sunrises hyderabad	Team/Screenshot_979.png	hyderabad
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: team_matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.team_matches_id_seq', 2, true);


--
-- Name: team_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.team_player_id_seq', 8, true);


--
-- Name: team_playerhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.team_playerhistory_id_seq', 1, false);


--
-- Name: team_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.team_points_id_seq', 1, false);


--
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhanush
--

SELECT pg_catalog.setval('public.team_team_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: team_matches team_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_pkey PRIMARY KEY (id);


--
-- Name: team_player team_player_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_player
    ADD CONSTRAINT team_player_pkey PRIMARY KEY (id);


--
-- Name: team_player team_player_player_jersey_no_key; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_player
    ADD CONSTRAINT team_player_player_jersey_no_key UNIQUE (player_jersey_no);


--
-- Name: team_playerhistory team_playerhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_playerhistory
    ADD CONSTRAINT team_playerhistory_pkey PRIMARY KEY (id);


--
-- Name: team_points team_points_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_points
    ADD CONSTRAINT team_points_pkey PRIMARY KEY (id);


--
-- Name: team_team team_team_name_key; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_name_key UNIQUE (name);


--
-- Name: team_team team_team_pkey; Type: CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: team_matches_contestant1_id_b7e32026; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_matches_contestant1_id_b7e32026 ON public.team_matches USING btree (contestant1_id);


--
-- Name: team_matches_contestant2_id_d1e3e5cb; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_matches_contestant2_id_d1e3e5cb ON public.team_matches USING btree (contestant2_id);


--
-- Name: team_player_player_jersey_no_a293edf3_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_player_player_jersey_no_a293edf3_like ON public.team_player USING btree (player_jersey_no varchar_pattern_ops);


--
-- Name: team_player_player_team_id_3360a1a1; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_player_player_team_id_3360a1a1 ON public.team_player USING btree (player_team_id);


--
-- Name: team_playerhistory_player_id_83b011ad; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_playerhistory_player_id_83b011ad ON public.team_playerhistory USING btree (player_id);


--
-- Name: team_points_match_id_8423c798; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_points_match_id_8423c798 ON public.team_points USING btree (match_id);


--
-- Name: team_team_name_b365d91c_like; Type: INDEX; Schema: public; Owner: dhanush
--

CREATE INDEX team_team_name_b365d91c_like ON public.team_team USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_matches team_matches_contestant1_id_b7e32026_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_contestant1_id_b7e32026_fk_team_team_id FOREIGN KEY (contestant1_id) REFERENCES public.team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_matches team_matches_contestant2_id_d1e3e5cb_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_contestant2_id_d1e3e5cb_fk_team_team_id FOREIGN KEY (contestant2_id) REFERENCES public.team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_player team_player_player_team_id_3360a1a1_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_player
    ADD CONSTRAINT team_player_player_team_id_3360a1a1_fk_team_team_id FOREIGN KEY (player_team_id) REFERENCES public.team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_playerhistory team_playerhistory_player_id_83b011ad_fk_team_player_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_playerhistory
    ADD CONSTRAINT team_playerhistory_player_id_83b011ad_fk_team_player_id FOREIGN KEY (player_id) REFERENCES public.team_player(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_points team_points_match_id_8423c798_fk_team_matches_id; Type: FK CONSTRAINT; Schema: public; Owner: dhanush
--

ALTER TABLE ONLY public.team_points
    ADD CONSTRAINT team_points_match_id_8423c798_fk_team_matches_id FOREIGN KEY (match_id) REFERENCES public.team_matches(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

