--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 12.1

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
-- Name: gw_company_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA gw_company_schema;


ALTER SCHEMA gw_company_schema OWNER TO postgres;

--
-- Name: edu_degree; Type: TYPE; Schema: gw_company_schema; Owner: postgres
--

CREATE TYPE gw_company_schema.edu_degree AS ENUM (
    'associate',
    'bachelor',
    'master',
    'doctoral'
);


ALTER TYPE gw_company_schema.edu_degree OWNER TO postgres;

--
-- Name: edu_title; Type: TYPE; Schema: gw_company_schema; Owner: postgres
--

CREATE TYPE gw_company_schema.edu_title AS ENUM (
    'BA',
    'BS',
    'MA',
    'MS',
    'MBA',
    'PhD',
    'MD',
    'JD'
);


ALTER TYPE gw_company_schema.edu_title OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: acquisitions; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.acquisitions (
    acquisition_id integer NOT NULL,
    crunchbase_uuid text,
    crunchbase_url text,
    crunchbase_rank bigint,
    created_at date,
    updated_at date,
    acquiree_id bigint,
    acquirer_id bigint,
    acquisition_type text,
    acquired_on date,
    price_usd bigint,
    price bigint,
    price_currency_code text
);


ALTER TABLE gw_company_schema.acquisitions OWNER TO postgres;

--
-- Name: acquisitions_acquisition_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.acquisitions_acquisition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.acquisitions_acquisition_id_seq OWNER TO postgres;

--
-- Name: acquisitions_acquisition_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.acquisitions_acquisition_id_seq OWNED BY gw_company_schema.acquisitions.acquisition_id;


--
-- Name: cities; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.cities (
    city_id integer NOT NULL,
    city text
);


ALTER TABLE gw_company_schema.cities OWNER TO postgres;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.cities_city_id_seq OWNER TO postgres;

--
-- Name: companies; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.companies (
    company_id bigint NOT NULL,
    founded_date date,
    name text,
    legal_name text,
    crunchbase_profile_id text,
    crunchbase_url text,
    address text,
    operating_status text,
    crunchbase_short_description text,
    last_funding_type text,
    employee_range text,
    email text,
    phone text,
    facebook_url text,
    linkedin_url text,
    twitter_url text,
    pre_series_a boolean,
    crunchbase_uuid text,
    is_school boolean,
    is_company boolean,
    domain text,
    total_funding_currency_code text,
    primary_role text,
    crunchbase_ranking bigint,
    closed_date date,
    created_date date,
    updated_date date,
    homepage_url text,
    num_funding_rounds integer,
    total_funding bigint,
    is_investor boolean,
    total_funding_usd bigint,
    max_employee integer,
    min_employee integer,
    tracking boolean
);


ALTER TABLE gw_company_schema.companies OWNER TO postgres;

--
-- Name: companies_articles; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.companies_articles (
    id bigint NOT NULL,
    company_id bigint,
    article_id text
);


ALTER TABLE gw_company_schema.companies_articles OWNER TO postgres;

--
-- Name: companies_company_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.companies_company_id_seq OWNER TO postgres;

--
-- Name: companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.companies_company_id_seq OWNED BY gw_company_schema.companies.company_id;


--
-- Name: company_cb_rank; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_cb_rank (
    rank_id bigint NOT NULL,
    rank bigint,
    company_id bigint,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_cb_rank OWNER TO postgres;

--
-- Name: company_cb_ranking_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_cb_ranking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_cb_ranking_id_seq OWNER TO postgres;

--
-- Name: company_city; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_city (
    company_city_id bigint NOT NULL,
    city_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_city OWNER TO postgres;

--
-- Name: company_city_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_city_id_seq OWNER TO postgres;

--
-- Name: company_country; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_country (
    company_country_id bigint NOT NULL,
    country_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_country OWNER TO postgres;

--
-- Name: company_country_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_country_id_seq OWNER TO postgres;

--
-- Name: company_description; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_description (
    description_id bigint,
    type text,
    source text,
    description text,
    company_id bigint,
    current boolean,
    created_date date
);


ALTER TABLE gw_company_schema.company_description OWNER TO postgres;

--
-- Name: company_description_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_description_id_seq OWNER TO postgres;

--
-- Name: company_employee_count_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_employee_count_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_employee_count_id_seq OWNER TO postgres;

--
-- Name: company_industries; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_industries (
    company_industry_id bigint NOT NULL,
    industry_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_industries OWNER TO postgres;

--
-- Name: company_names; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_names (
    name_id integer NOT NULL,
    name text NOT NULL,
    company_id bigint NOT NULL,
    created_on date,
    updated_on date
);


ALTER TABLE gw_company_schema.company_names OWNER TO postgres;

--
-- Name: company_postal_code; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_postal_code (
    company_postal_code_id bigint NOT NULL,
    postal_code_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_postal_code OWNER TO postgres;

--
-- Name: company_postal_code_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_postal_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_postal_code_id_seq OWNER TO postgres;

--
-- Name: company_region; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_region (
    company_region_id bigint NOT NULL,
    region_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_region OWNER TO postgres;

--
-- Name: company_region_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_region_id_seq OWNER TO postgres;

--
-- Name: company_state; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.company_state (
    company_state_id bigint NOT NULL,
    state_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at date,
    current boolean
);


ALTER TABLE gw_company_schema.company_state OWNER TO postgres;

--
-- Name: company_state_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.company_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.company_state_id_seq OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.countries (
    country_id integer NOT NULL,
    country text
);


ALTER TABLE gw_company_schema.countries OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.countries_country_id_seq OWNER TO postgres;

--
-- Name: deal_flow_pitch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_flow_pitch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_flow_pitch_id_seq OWNER TO postgres;

--
-- Name: deal_flow; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.deal_flow (
    pitch_id integer DEFAULT nextval('public.deal_flow_pitch_id_seq'::regclass) NOT NULL,
    email text,
    company_name text,
    location text,
    executive_team text,
    founding_date date,
    num_employees integer,
    industry text,
    value_prop text,
    ai_use text,
    stage text,
    funding_round text,
    go_to_market text,
    amount_raised integer,
    post_money integer,
    angels text,
    misc text,
    date_submitted date,
    gw_connection text
);


ALTER TABLE gw_company_schema.deal_flow OWNER TO postgres;

--
-- Name: educations; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.educations (
    education_id integer NOT NULL,
    school text,
    degree gw_company_schema.edu_degree,
    title gw_company_schema.edu_title,
    start_date date,
    complete date,
    person_id integer,
    updated_at date,
    created_at date
);


ALTER TABLE gw_company_schema.educations OWNER TO postgres;

--
-- Name: educations_education_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.educations_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.educations_education_id_seq OWNER TO postgres;

--
-- Name: educations_education_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.educations_education_id_seq OWNED BY gw_company_schema.educations.education_id;


--
-- Name: employee_count; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.employee_count (
    company_employee_count_id bigint NOT NULL,
    employee_count text,
    company_id bigint,
    created_date date,
    current boolean
);


ALTER TABLE gw_company_schema.employee_count OWNER TO postgres;

--
-- Name: funding_rounds; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.funding_rounds (
    funding_id integer NOT NULL,
    company_id integer NOT NULL,
    company_name text,
    crunchbase_uuid text,
    crunchbase_profile_id text,
    crunchbase_url text,
    crunchbase_ranking bigint,
    created_at date,
    updated_at date,
    country text,
    state text,
    region text,
    city text,
    round_type text,
    announced_on date,
    raised_amount_usd bigint,
    raised_amount bigint,
    raised_amount_currency text,
    post_money_valuation_usd bigint,
    post_money_valuation bigint,
    post_money_valuation_currency text,
    investor_count integer
);


ALTER TABLE gw_company_schema.funding_rounds OWNER TO postgres;

--
-- Name: funding_rounds_funding_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.funding_rounds_funding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.funding_rounds_funding_id_seq OWNER TO postgres;

--
-- Name: funding_rounds_funding_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.funding_rounds_funding_id_seq OWNED BY gw_company_schema.funding_rounds.funding_id;


--
-- Name: industries; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.industries (
    industry_id integer NOT NULL,
    created_at date,
    source text,
    industry text
);


ALTER TABLE gw_company_schema.industries OWNER TO postgres;

--
-- Name: industries_industry_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.industries_industry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.industries_industry_id_seq OWNER TO postgres;

--
-- Name: industries_industry_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.industries_industry_id_seq OWNED BY gw_company_schema.industries.industry_id;


--
-- Name: investments; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.investments (
    amount bigint,
    currency character varying(5),
    amount_usd bigint,
    lead_investor boolean,
    announced_on date,
    crunchbase_uuid integer,
    investor_id integer NOT NULL,
    funding_round_id integer NOT NULL,
    investment_id integer NOT NULL,
    lead_partner integer
);


ALTER TABLE gw_company_schema.investments OWNER TO postgres;

--
-- Name: investors; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.investors (
    investor_id integer NOT NULL,
    name character varying(45),
    type character varying(45),
    function character varying(45),
    investor_type character varying(45),
    number_of_investments character varying(45),
    total_amount_invested character varying(45),
    aum character varying(45),
    founded_date date,
    closed_date date,
    company_id integer NOT NULL,
    num_exits integer
);


ALTER TABLE gw_company_schema.investors OWNER TO postgres;

--
-- Name: investors_investor_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.investors_investor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.investors_investor_id_seq OWNER TO postgres;

--
-- Name: investors_investor_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.investors_investor_id_seq OWNED BY gw_company_schema.investors.investor_id;


--
-- Name: jobs; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.jobs (
    job_id integer NOT NULL,
    title text,
    function character varying(45),
    seniority character varying(45),
    is_current boolean,
    start_date character varying(45),
    end_date character varying(45),
    duration character varying(45),
    industry character varying(45),
    company_size character varying(45),
    job_description text,
    location text,
    person_id integer,
    company_id integer,
    updated_at date,
    created_at date,
    company_name text
);


ALTER TABLE gw_company_schema.jobs OWNER TO postgres;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.jobs_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.jobs_job_id_seq OWNER TO postgres;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.jobs_job_id_seq OWNED BY gw_company_schema.jobs.job_id;


--
-- Name: names_name_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.names_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.names_name_id_seq OWNER TO postgres;

--
-- Name: names_name_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.names_name_id_seq OWNED BY gw_company_schema.company_names.name_id;


--
-- Name: news_articles; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.news_articles (
    id text NOT NULL,
    url text,
    source text,
    title text,
    content_html text,
    content text,
    date date,
    feedly_keywords text,
    links text,
    domains text
);


ALTER TABLE gw_company_schema.news_articles OWNER TO postgres;

--
-- Name: people; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.people (
    person_id integer NOT NULL,
    first_name text,
    last_name text,
    full_name text,
    gender character varying(45),
    state character varying(45),
    region character varying(45),
    city character varying(45),
    linkedin_url text,
    birth_year character varying(45),
    country character varying(45),
    crunchbase_ranking character varying(45),
    crunchbase_url text,
    crunchbase_profile_id text,
    crunchbase_uuid text,
    facebook_url text,
    twitter_url text,
    linkedin_connections character varying(45),
    linkedin_subscribers character varying(45),
    glasswing_connections text,
    investors_investor_id integer,
    primary_function text,
    emails text,
    glasswing_connection_score text,
    linkedin_bio text,
    crunchbase_bio text,
    phone text,
    last_scraped_date text,
    linkedin_scraped text,
    linkedin_profile_id text,
    notes text,
    reach_out_limitations text,
    primary_email text,
    gw_network boolean,
    updated_at date,
    created_at date
);


ALTER TABLE gw_company_schema.people OWNER TO postgres;

--
-- Name: people_person_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.people_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.people_person_id_seq OWNER TO postgres;

--
-- Name: people_person_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.people_person_id_seq OWNED BY gw_company_schema.people.person_id;


--
-- Name: postal_codes; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.postal_codes (
    postal_code_id integer NOT NULL,
    postal_code text
);


ALTER TABLE gw_company_schema.postal_codes OWNER TO postgres;

--
-- Name: postal_codes_postal_code_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.postal_codes_postal_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.postal_codes_postal_code_id_seq OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.regions (
    region_id integer NOT NULL,
    region text
);


ALTER TABLE gw_company_schema.regions OWNER TO postgres;

--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.regions_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.regions_region_id_seq OWNER TO postgres;

--
-- Name: skills; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.skills (
    skill_id integer NOT NULL,
    skill text,
    endorsement integer,
    added_date date,
    person_id integer
);


ALTER TABLE gw_company_schema.skills OWNER TO postgres;

--
-- Name: skills_skill_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.skills_skill_id_seq OWNER TO postgres;

--
-- Name: skills_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.skills_skill_id_seq OWNED BY gw_company_schema.skills.skill_id;


--
-- Name: source; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.source (
    source_id integer NOT NULL,
    name character varying(80),
    url text,
    create_date timestamp with time zone NOT NULL,
    last_update_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE gw_company_schema.source OWNER TO postgres;

--
-- Name: source_source_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.source_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.source_source_id_seq OWNER TO postgres;

--
-- Name: source_source_id_seq; Type: SEQUENCE OWNED BY; Schema: gw_company_schema; Owner: postgres
--

ALTER SEQUENCE gw_company_schema.source_source_id_seq OWNED BY gw_company_schema.source.source_id;


--
-- Name: states; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.states (
    state_id integer NOT NULL,
    states text
);


ALTER TABLE gw_company_schema.states OWNER TO postgres;

--
-- Name: states_state_id_seq; Type: SEQUENCE; Schema: gw_company_schema; Owner: postgres
--

CREATE SEQUENCE gw_company_schema.states_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gw_company_schema.states_state_id_seq OWNER TO postgres;

--
-- Name: table_source_update; Type: TABLE; Schema: gw_company_schema; Owner: postgres
--

CREATE TABLE gw_company_schema.table_source_update (
    table_name character varying(128),
    table_row_id integer,
    last_update_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_id integer
);


ALTER TABLE gw_company_schema.table_source_update OWNER TO postgres;

--
-- Name: gw_company_schema.jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."gw_company_schema.jobs" (
    index bigint,
    title text,
    function text,
    seniority text,
    is_current boolean,
    start_date text,
    end_date text,
    duration double precision,
    industry text,
    company_size text,
    job_description text,
    location text,
    company_name text,
    updated_at date,
    created_at date,
    company_id double precision,
    person_id double precision
);


ALTER TABLE public."gw_company_schema.jobs" OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    index bigint,
    title text,
    function text,
    seniority text,
    is_current boolean,
    start_date text,
    end_date text,
    duration double precision,
    industry text,
    company_size text,
    job_description text,
    location text,
    company_name text,
    updated_at date,
    created_at date,
    company_id double precision,
    person_id double precision
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: acquisitions acquisition_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.acquisitions ALTER COLUMN acquisition_id SET DEFAULT nextval('gw_company_schema.acquisitions_acquisition_id_seq'::regclass);


--
-- Name: companies company_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.companies ALTER COLUMN company_id SET DEFAULT nextval('gw_company_schema.companies_company_id_seq'::regclass);


--
-- Name: company_names name_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_names ALTER COLUMN name_id SET DEFAULT nextval('gw_company_schema.names_name_id_seq'::regclass);


--
-- Name: educations education_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.educations ALTER COLUMN education_id SET DEFAULT nextval('gw_company_schema.educations_education_id_seq'::regclass);


--
-- Name: funding_rounds funding_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.funding_rounds ALTER COLUMN funding_id SET DEFAULT nextval('gw_company_schema.funding_rounds_funding_id_seq'::regclass);


--
-- Name: industries industry_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.industries ALTER COLUMN industry_id SET DEFAULT nextval('gw_company_schema.industries_industry_id_seq'::regclass);


--
-- Name: investors investor_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investors ALTER COLUMN investor_id SET DEFAULT nextval('gw_company_schema.investors_investor_id_seq'::regclass);


--
-- Name: jobs job_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.jobs ALTER COLUMN job_id SET DEFAULT nextval('gw_company_schema.jobs_job_id_seq'::regclass);


--
-- Name: people person_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.people ALTER COLUMN person_id SET DEFAULT nextval('gw_company_schema.people_person_id_seq'::regclass);


--
-- Name: skills skill_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.skills ALTER COLUMN skill_id SET DEFAULT nextval('gw_company_schema.skills_skill_id_seq'::regclass);


--
-- Name: source source_id; Type: DEFAULT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.source ALTER COLUMN source_id SET DEFAULT nextval('gw_company_schema.source_source_id_seq'::regclass);


--
-- Name: acquisitions acquisitions_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.acquisitions
    ADD CONSTRAINT acquisitions_pkey PRIMARY KEY (acquisition_id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: companies_articles companies_articles_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.companies_articles
    ADD CONSTRAINT companies_articles_pkey PRIMARY KEY (id);


--
-- Name: companies companies_crunchbase_uuid_key; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.companies
    ADD CONSTRAINT companies_crunchbase_uuid_key UNIQUE (crunchbase_uuid);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);


--
-- Name: company_city company_city_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_city
    ADD CONSTRAINT company_city_pkey PRIMARY KEY (company_city_id);


--
-- Name: company_country company_country_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_country
    ADD CONSTRAINT company_country_pkey PRIMARY KEY (company_country_id);


--
-- Name: company_industries company_industries_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_industries
    ADD CONSTRAINT company_industries_pkey PRIMARY KEY (company_industry_id);


--
-- Name: company_postal_code company_postal_code_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_postal_code
    ADD CONSTRAINT company_postal_code_pkey PRIMARY KEY (company_postal_code_id);


--
-- Name: company_region company_region_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_region
    ADD CONSTRAINT company_region_pkey PRIMARY KEY (company_region_id);


--
-- Name: company_state company_state_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_state
    ADD CONSTRAINT company_state_pkey PRIMARY KEY (company_state_id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: company_cb_rank crunchbase_ranking_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_cb_rank
    ADD CONSTRAINT crunchbase_ranking_pkey PRIMARY KEY (rank_id);


--
-- Name: deal_flow deal_flow_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.deal_flow
    ADD CONSTRAINT deal_flow_pkey PRIMARY KEY (pitch_id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (education_id);


--
-- Name: employee_count employee_count_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.employee_count
    ADD CONSTRAINT employee_count_pkey PRIMARY KEY (company_employee_count_id);


--
-- Name: funding_rounds funding_rounds_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.funding_rounds
    ADD CONSTRAINT funding_rounds_pkey PRIMARY KEY (funding_id);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (industry_id);


--
-- Name: investments investments_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investments
    ADD CONSTRAINT investments_pkey PRIMARY KEY (investment_id);


--
-- Name: investors investors_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investors
    ADD CONSTRAINT investors_pkey PRIMARY KEY (investor_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: company_names names_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_names
    ADD CONSTRAINT names_pkey PRIMARY KEY (name_id);


--
-- Name: news_articles news_articles_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.news_articles
    ADD CONSTRAINT news_articles_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (person_id);


--
-- Name: postal_codes postal_codes_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.postal_codes
    ADD CONSTRAINT postal_codes_pkey PRIMARY KEY (postal_code_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (source_id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);


--
-- Name: ix_gw_company_schema.jobs_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ix_gw_company_schema.jobs_index" ON public."gw_company_schema.jobs" USING btree (index);


--
-- Name: ix_jobs_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_jobs_index ON public.jobs USING btree (index);


--
-- Name: acquisitions acquisitions_acquiree_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.acquisitions
    ADD CONSTRAINT acquisitions_acquiree_id_fkey FOREIGN KEY (acquiree_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: acquisitions acquisitions_acquirer_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.acquisitions
    ADD CONSTRAINT acquisitions_acquirer_id_fkey FOREIGN KEY (acquirer_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: companies_articles company_article_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.companies_articles
    ADD CONSTRAINT company_article_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: company_city company_city_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_city
    ADD CONSTRAINT company_city_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: company_city company_city_industry_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_city
    ADD CONSTRAINT company_city_industry_id_fkey FOREIGN KEY (city_id) REFERENCES gw_company_schema.cities(city_id);


--
-- Name: company_country company_country_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_country
    ADD CONSTRAINT company_country_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: company_country company_country_country_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_country
    ADD CONSTRAINT company_country_country_id_fkey FOREIGN KEY (country_id) REFERENCES gw_company_schema.countries(country_id);


--
-- Name: company_description company_description_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_description
    ADD CONSTRAINT company_description_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: funding_rounds company_id; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.funding_rounds
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: investors company_id; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investors
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: companies_articles company_id_company_article_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.companies_articles
    ADD CONSTRAINT company_id_company_article_fkey FOREIGN KEY (article_id) REFERENCES gw_company_schema.news_articles(id) NOT VALID;


--
-- Name: company_industries company_industries_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_industries
    ADD CONSTRAINT company_industries_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: company_industries company_industries_industry_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_industries
    ADD CONSTRAINT company_industries_industry_id_fkey FOREIGN KEY (industry_id) REFERENCES gw_company_schema.industries(industry_id) NOT VALID;


--
-- Name: company_postal_code company_postal_code_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_postal_code
    ADD CONSTRAINT company_postal_code_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: company_postal_code company_postal_code_postal_code_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_postal_code
    ADD CONSTRAINT company_postal_code_postal_code_id_fkey FOREIGN KEY (postal_code_id) REFERENCES gw_company_schema.postal_codes(postal_code_id);


--
-- Name: company_region company_region_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_region
    ADD CONSTRAINT company_region_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: company_region company_region_region_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_region
    ADD CONSTRAINT company_region_region_id_fkey FOREIGN KEY (region_id) REFERENCES gw_company_schema.regions(region_id);


--
-- Name: company_state company_state_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_state
    ADD CONSTRAINT company_state_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: company_state company_state_state_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_state
    ADD CONSTRAINT company_state_state_id_fkey FOREIGN KEY (state_id) REFERENCES gw_company_schema.states(state_id) NOT VALID;


--
-- Name: company_cb_rank crunchbase_ranking_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_cb_rank
    ADD CONSTRAINT crunchbase_ranking_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: educations educations_person_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.educations
    ADD CONSTRAINT educations_person_id_fkey FOREIGN KEY (person_id) REFERENCES gw_company_schema.people(person_id) NOT VALID;


--
-- Name: employee_count employee_count_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.employee_count
    ADD CONSTRAINT employee_count_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id);


--
-- Name: investments investments_funding_round_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investments
    ADD CONSTRAINT investments_funding_round_id_fkey FOREIGN KEY (funding_round_id) REFERENCES gw_company_schema.funding_rounds(funding_id) NOT VALID;


--
-- Name: investments investments_investor_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investments
    ADD CONSTRAINT investments_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES gw_company_schema.investors(investor_id) NOT VALID;


--
-- Name: investments investments_lead_partner_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.investments
    ADD CONSTRAINT investments_lead_partner_fkey FOREIGN KEY (lead_partner) REFERENCES gw_company_schema.people(person_id) NOT VALID;


--
-- Name: jobs jobs_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.jobs
    ADD CONSTRAINT jobs_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: jobs jobs_person_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.jobs
    ADD CONSTRAINT jobs_person_id_fkey FOREIGN KEY (person_id) REFERENCES gw_company_schema.people(person_id) NOT VALID;


--
-- Name: company_names names_company_id_fkey; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.company_names
    ADD CONSTRAINT names_company_id_fkey FOREIGN KEY (company_id) REFERENCES gw_company_schema.companies(company_id) NOT VALID;


--
-- Name: skills person_id; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.skills
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES gw_company_schema.people(person_id) NOT VALID;


--
-- Name: table_source_update source_id; Type: FK CONSTRAINT; Schema: gw_company_schema; Owner: postgres
--

ALTER TABLE ONLY gw_company_schema.table_source_update
    ADD CONSTRAINT source_id FOREIGN KEY (source_id) REFERENCES gw_company_schema.source(source_id) NOT VALID;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: cloudsqlsuperuser
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

