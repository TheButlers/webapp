--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: medal_pkey; Type: CONSTRAINT; Schema: public; Owner: sails; Tablespace: 
--

ALTER TABLE ONLY medal
    ADD CONSTRAINT medal_pkey PRIMARY KEY (img);


--
-- PostgreSQL database dump complete
--

