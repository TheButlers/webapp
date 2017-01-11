--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attempt; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE attempt (
    "user" integer,
    successful boolean,
    ip text,
    port text,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.attempt OWNER TO sails;

--
-- Name: attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attempt_id_seq OWNER TO sails;

--
-- Name: attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE attempt_id_seq OWNED BY attempt.id;


--
-- Name: auth; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE auth (
    "user" integer,
    username text,
    password text,
    "resetToken" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.auth OWNER TO sails;

--
-- Name: auth_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_id_seq OWNER TO sails;

--
-- Name: auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE auth_id_seq OWNED BY auth.id;


--
-- Name: exercise; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE exercise (
    machine integer,
    "user" integer,
    "startTime" timestamp with time zone,
    "stopTime" timestamp with time zone,
    "numberOfSteps" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.exercise OWNER TO sails;

--
-- Name: exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_id_seq OWNER TO sails;

--
-- Name: exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE exercise_id_seq OWNED BY exercise.id;


--
-- Name: friend; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE friend (
    "user" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.friend OWNER TO sails;

--
-- Name: friend_friends_friend__user_friends; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE friend_friends_friend__user_friends (
    id integer NOT NULL,
    user_friends integer,
    friend_friends_friend integer
);


ALTER TABLE public.friend_friends_friend__user_friends OWNER TO sails;

--
-- Name: friend_friends_friend__user_friends_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE friend_friends_friend__user_friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friend_friends_friend__user_friends_id_seq OWNER TO sails;

--
-- Name: friend_friends_friend__user_friends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE friend_friends_friend__user_friends_id_seq OWNED BY friend_friends_friend__user_friends.id;


--
-- Name: friend_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE friend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friend_id_seq OWNER TO sails;

--
-- Name: friend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE friend_id_seq OWNED BY friend.id;


--
-- Name: jwt; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE jwt (
    token text,
    owner integer,
    revoked boolean,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.jwt OWNER TO sails;

--
-- Name: jwt_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE jwt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jwt_id_seq OWNER TO sails;

--
-- Name: jwt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE jwt_id_seq OWNED BY jwt.id;


--
-- Name: machine; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE machine (
    type text,
    "fitnessCorner" text,
    "dateInstalled" date,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.machine OWNER TO sails;

--
-- Name: machine_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE machine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.machine_id_seq OWNER TO sails;

--
-- Name: machine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE machine_id_seq OWNED BY machine.id;


--
-- Name: medal; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE medal (
    img text NOT NULL,
    description text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.medal OWNER TO sails;

--
-- Name: medal_winners__user_medals; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE medal_winners__user_medals (
    id integer NOT NULL,
    medal_winners text,
    user_medals integer
);


ALTER TABLE public.medal_winners__user_medals OWNER TO sails;

--
-- Name: medal_winners__user_medals_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE medal_winners__user_medals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medal_winners__user_medals_id_seq OWNER TO sails;

--
-- Name: medal_winners__user_medals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE medal_winners__user_medals_id_seq OWNED BY medal_winners__user_medals.id;


--
-- Name: resettoken; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE resettoken (
    token text,
    owner integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.resettoken OWNER TO sails;

--
-- Name: resettoken_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE resettoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resettoken_id_seq OWNER TO sails;

--
-- Name: resettoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE resettoken_id_seq OWNED BY resettoken.id;


--
-- Name: use; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE use (
    "remoteAddress" text,
    "jsonWebToken" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.use OWNER TO sails;

--
-- Name: use_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE use_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.use_id_seq OWNER TO sails;

--
-- Name: use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE use_id_seq OWNED BY use.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE "user" (
    auth integer,
    fullname text,
    score integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public."user" OWNER TO sails;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO sails;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: user_waterlock; Type: TABLE; Schema: public; Owner: sails; Tablespace: 
--

CREATE TABLE user_waterlock (
    auth integer,
    fullname text,
    age integer,
    "fitnessCorner" text,
    score integer,
    "ponderedScore" integer,
    "rfidTag" text,
    pic text,
    phone text,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.user_waterlock OWNER TO sails;

--
-- Name: user_waterlock_id_seq; Type: SEQUENCE; Schema: public; Owner: sails
--

CREATE SEQUENCE user_waterlock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_waterlock_id_seq OWNER TO sails;

--
-- Name: user_waterlock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sails
--

ALTER SEQUENCE user_waterlock_id_seq OWNED BY user_waterlock.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY attempt ALTER COLUMN id SET DEFAULT nextval('attempt_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY auth ALTER COLUMN id SET DEFAULT nextval('auth_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY exercise ALTER COLUMN id SET DEFAULT nextval('exercise_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY friend ALTER COLUMN id SET DEFAULT nextval('friend_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY friend_friends_friend__user_friends ALTER COLUMN id SET DEFAULT nextval('friend_friends_friend__user_friends_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY jwt ALTER COLUMN id SET DEFAULT nextval('jwt_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY machine ALTER COLUMN id SET DEFAULT nextval('machine_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY medal_winners__user_medals ALTER COLUMN id SET DEFAULT nextval('medal_winners__user_medals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY resettoken ALTER COLUMN id SET DEFAULT nextval('resettoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY use ALTER COLUMN id SET DEFAULT nextval('use_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sails
--

ALTER TABLE ONLY user_waterlock ALTER COLUMN id SET DEFAULT nextval('user_waterlock_id_seq'::regclass);


--
-- Data for Name: attempt; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY attempt ("user", successful, ip, port, id, "createdAt", "updatedAt") FROM stdin;
5	t	118.189.120.83	49798	3	2015-04-23 17:51:21-04	2015-04-23 17:51:21-04
3	t	118.189.120.83	3536	4	2015-04-23 18:07:58-04	2015-04-23 18:07:58-04
\.


--
-- Name: attempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('attempt_id_seq', 4, true);


--
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY auth ("user", username, password, "resetToken", id, "createdAt", "updatedAt") FROM stdin;
1	Walter	$2a$10$8QXQ0AHU7UkvuZquTm3xhOJb5QW1ytaYXsNA2FKIbBFPblmKD7aOm	\N	1	2015-04-23 17:38:27-04	2015-04-23 17:38:27-04
2	Suzanne	$2a$10$3wpVinYC4BfRE8yKXHKJjOT4/AAQ4aN0vaqlLl6ktVOFpQn1.gYbe	\N	2	2015-04-23 17:38:42-04	2015-04-23 17:38:42-04
3	Joaquim	$2a$10$rDYbTH8XqjvYhzW2a/ZmmudbfIVQkN6B7FtAD.Y2bruYyHoai0C4W	\N	3	2015-04-23 17:38:46-04	2015-04-23 17:38:46-04
4	Irene	$2a$10$ePZZzKKz.T0cCTv.ORQRT.yMpYYBn13RIQHLqv74l4PJ/hA7BhGI2	\N	4	2015-04-23 17:38:49-04	2015-04-23 17:38:49-04
6	Kenneth	$2a$10$0vGTnM7tzP3UuXVE68.9UerTd4fXIZUxjSSGf5vVZKLL41FZVQj3u	\N	6	2015-04-23 17:38:55-04	2015-04-23 17:38:55-04
7	MisterLim	$2a$10$wG/mYbn.v6d2r2lFYs7w1.1MJSsnLpWbNm2LZxyaENqCBXkjbKJpO	\N	7	2015-04-23 17:38:58-04	2015-04-23 17:38:58-04
8	Kheng	$2a$10$U3MGQi.ymomuN.qO1RBfyO0EBicHwD1NNCbcOkpwXoTLtD5SVENSy	\N	8	2015-04-23 17:39:02-04	2015-04-23 17:39:02-04
5	Michel	$2a$10$VkUrYvISL3DVC4vpLpXi.OVgpdXZ5PmAWSCBeepe3xO4hfJoIJAem	\N	5	2015-04-23 17:38:53-04	2015-04-23 17:51:08-04
\.


--
-- Name: auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('auth_id_seq', 8, true);


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY exercise (machine, "user", "startTime", "stopTime", "numberOfSteps", id, "createdAt", "updatedAt") FROM stdin;
1	1	2015-04-23 01:04:17-04	\N	100	1	2015-04-23 17:53:39-04	2015-04-23 17:53:40-04
1	2	2015-04-23 01:04:17-04	\N	100	2	2015-04-23 17:53:54-04	2015-04-23 17:53:57-04
1	3	2015-04-23 01:04:17-04	\N	100	3	2015-04-23 17:54:02-04	2015-04-23 17:54:05-04
1	4	2015-04-23 01:04:17-04	\N	100	4	2015-04-23 17:54:05-04	2015-04-23 17:54:08-04
1	5	2015-04-23 01:04:17-04	\N	100	5	2015-04-23 17:54:08-04	2015-04-23 17:54:12-04
1	6	2015-04-23 01:04:17-04	\N	100	6	2015-04-23 17:54:11-04	2015-04-23 17:54:14-04
1	7	2015-04-23 01:04:17-04	\N	100	7	2015-04-23 17:54:14-04	2015-04-23 17:54:17-04
1	8	2015-04-23 01:04:17-04	\N	100	8	2015-04-23 17:54:18-04	2015-04-23 17:54:23-04
1	3	2015-04-23 01:04:17-04	\N	0	10	2015-04-23 18:02:43-04	2015-04-23 18:02:43-04
1	\N	2015-04-23 18:00:47-04	\N	13	9	2015-04-23 18:00:49-04	2015-04-23 18:04:16-04
1	3	2015-04-23 01:04:17-04	\N	0	11	2015-04-23 18:09:57-04	2015-04-23 18:09:57-04
1	3	2015-04-23 01:04:17-04	\N	0	12	2015-04-23 18:11:01-04	2015-04-23 18:11:01-04
1	\N	2015-04-23 18:11:38-04	\N	21	13	2015-04-23 18:11:40-04	2015-04-23 18:12:15-04
\.


--
-- Name: exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('exercise_id_seq', 13, true);


--
-- Data for Name: friend; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY friend ("user", id, "createdAt", "updatedAt") FROM stdin;
8	8	2015-04-23 17:30:34-04	2015-04-23 17:30:34-04
1	1	2015-04-23 17:40:50-04	2015-04-23 17:40:50-04
2	2	2015-04-23 17:41:04-04	2015-04-23 17:41:04-04
3	3	2015-04-23 17:41:22-04	2015-04-23 17:41:22-04
4	4	2015-04-23 17:41:35-04	2015-04-23 17:41:35-04
5	5	2015-04-23 17:41:46-04	2015-04-23 17:41:46-04
6	6	2015-04-23 17:41:53-04	2015-04-23 17:41:53-04
7	7	2015-04-23 17:42:02-04	2015-04-23 17:42:02-04
\.


--
-- Data for Name: friend_friends_friend__user_friends; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY friend_friends_friend__user_friends (id, user_friends, friend_friends_friend) FROM stdin;
13	3	5
14	5	3
15	7	5
16	5	7
17	2	5
18	5	2
19	1	5
20	5	1
21	3	2
22	2	3
23	3	7
24	7	3
\.


--
-- Name: friend_friends_friend__user_friends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('friend_friends_friend__user_friends_id_seq', 24, true);


--
-- Name: friend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('friend_id_seq', 8, true);


--
-- Data for Name: jwt; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY jwt (token, owner, revoked, id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: jwt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('jwt_id_seq', 1, false);


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY machine (type, "fitnessCorner", "dateInstalled", id, "createdAt", "updatedAt") FROM stdin;
Stepper	Bukit Batok	2015-03-28	1	2015-04-20 10:51:56-04	2015-04-23 17:47:30-04
\.


--
-- Name: machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('machine_id_seq', 1, true);


--
-- Data for Name: medal; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY medal (img, description, "createdAt", "updatedAt") FROM stdin;
steps-100	Reach 100 steps!	2015-04-23 01:03:27-04	2015-04-23 01:03:27-04
steps-500	Reach 500 steps!	2015-04-23 01:03:32-04	2015-04-23 01:03:32-04
steps-1000	Reach 1000 steps!	2015-04-23 01:03:39-04	2015-04-23 01:03:39-04
days-3	Go to the gym 3 days in a row!	2015-04-23 01:03:56-04	2015-04-23 01:03:56-04
days-5	Go to the gym 5 days in a row!	2015-04-23 01:04:00-04	2015-04-23 01:04:00-04
days-7	Go to the gym 7 days in a row!	2015-04-23 01:04:04-04	2015-04-23 01:04:04-04
friends-3	Invite 3 friends!	2015-04-23 01:04:17-04	2015-04-23 01:04:17-04
friends-5	Invite 5 friends!	2015-04-23 01:04:21-04	2015-04-23 01:04:21-04
friends-10	Invite 10 friends!	2015-04-23 01:04:26-04	2015-04-23 01:04:26-04
local-week	Top your area this week!	2015-04-23 01:04:39-04	2015-04-23 01:04:39-04
local-month	Top your area this month!	2015-04-23 01:04:44-04	2015-04-23 01:04:44-04
local-year	Top your area this year!	2015-04-23 01:04:51-04	2015-04-23 01:04:51-04
national-week	Top the country this week!	2015-04-23 01:05:05-04	2015-04-23 01:05:05-04
national-month	Top the country this month!	2015-04-23 01:05:10-04	2015-04-23 01:05:10-04
national-year	Top the country this year!	2015-04-23 01:05:15-04	2015-04-23 01:05:15-04
\.


--
-- Data for Name: medal_winners__user_medals; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY medal_winners__user_medals (id, medal_winners, user_medals) FROM stdin;
4	steps-100	1
5	friends-3	1
6	friends-5	1
7	friends-5	3
8	friends-3	3
9	steps-100	3
10	steps-100	5
11	steps-500	5
12	friends-3	5
13	friends-5	5
14	friends-10	5
15	days-3	5
16	days-5	5
17	local-week	5
\.


--
-- Name: medal_winners__user_medals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('medal_winners__user_medals_id_seq', 17, true);


--
-- Data for Name: resettoken; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY resettoken (token, owner, id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: resettoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('resettoken_id_seq', 1, false);


--
-- Data for Name: use; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY use ("remoteAddress", "jsonWebToken", id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('use_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY "user" (auth, fullname, score, id, "createdAt", "updatedAt") FROM stdin;
1	Joaquim	0	2	2015-04-19 08:03:06-04	2015-04-19 08:03:06-04
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- Data for Name: user_waterlock; Type: TABLE DATA; Schema: public; Owner: sails
--

COPY user_waterlock (auth, fullname, age, "fitnessCorner", score, "ponderedScore", "rfidTag", pic, phone, id, "createdAt", "updatedAt") FROM stdin;
1	Walter Ong	48	Bukit Timah	100	100	\N	mrwhite	\N	1	2015-04-23 17:40:50-04	2015-04-23 18:04:16-04
2	Suzanne Tan	83	Changi East	100	560	\N	waterlili	\N	2	2015-04-23 17:41:04-04	2015-04-23 18:11:45-04
3	Joaquim Bell	27	Bukit Batok	100	100	\N	peterpan	+6581193783	3	2015-04-23 17:41:22-04	2015-04-23 18:11:50-04
4	Irene Sia	63	\N	100	100	\N	\N	\N	4	2015-04-23 17:41:35-04	2015-04-23 18:11:55-04
5	Michel Tison	83	Bukit Batok	100	560	\N	avatar	+6598525512	5	2015-04-23 17:41:46-04	2015-04-23 18:12:00-04
6	Kenneth Ng	71	\N	100	320	\N	\N	\N	6	2015-04-23 17:41:53-04	2015-04-23 18:12:05-04
7	Lim Chuan	57	\N	100	100	\N	uncleli	\N	7	2015-04-23 17:42:02-04	2015-04-23 18:12:10-04
8	Kheng Meng	33	\N	100	100	\N	\N	\N	8	2015-04-23 17:42:07-04	2015-04-23 18:12:15-04
\.


--
-- Name: user_waterlock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sails
--

SELECT pg_catalog.setval('user_waterlock_id_seq', 8, true);


--
-- Name: attempt_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY attempt
    ADD CONSTRAINT attempt_pkey PRIMARY KEY (id);


--
-- Name: auth_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (id);


--
-- Name: auth_username_key; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY auth
    ADD CONSTRAINT auth_username_key UNIQUE (username);


--
-- Name: exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (id);


--
-- Name: friend_friends_friend__user_friends_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY friend_friends_friend__user_friends
    ADD CONSTRAINT friend_friends_friend__user_friends_pkey PRIMARY KEY (id);


--
-- Name: friend_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY friend
    ADD CONSTRAINT friend_pkey PRIMARY KEY (id);


--
-- Name: jwt_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY jwt
    ADD CONSTRAINT jwt_pkey PRIMARY KEY (id);


--
-- Name: machine_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (id);


--
-- Name: medal_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY medal
    ADD CONSTRAINT medal_pkey PRIMARY KEY (img);


--
-- Name: medal_winners__user_medals_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY medal_winners__user_medals
    ADD CONSTRAINT medal_winners__user_medals_pkey PRIMARY KEY (id);


--
-- Name: resettoken_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY resettoken
    ADD CONSTRAINT resettoken_pkey PRIMARY KEY (id);


--
-- Name: use_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY use
    ADD CONSTRAINT use_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_waterlock_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY user_waterlock
    ADD CONSTRAINT user_waterlock_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

