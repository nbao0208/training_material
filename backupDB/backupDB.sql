--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg120+1)
-- Dumped by pg_dump version 14.10 (Debian 14.10-1.pgdg120+1)

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

SET default_table_access_method = heap;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO baonguyen;

--
-- Name: tm_answer; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_answer (
    id bigint NOT NULL,
    answer text NOT NULL,
    tm_question_id bigint NOT NULL,
    is_correct boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_answer OWNER TO baonguyen;

--
-- Name: TABLE tm_answer; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_answer IS 'tm_answer table';


--
-- Name: COLUMN tm_answer.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.id IS 'tm_answer ID is a unique value';


--
-- Name: COLUMN tm_answer.answer; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.answer IS 'The answer of the tm_question';


--
-- Name: COLUMN tm_answer.tm_question_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.tm_question_id IS 'tm_question ID is a connective value to tm_question table';


--
-- Name: COLUMN tm_answer.is_correct; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.is_correct IS 'The answer of users is correct or not';


--
-- Name: COLUMN tm_answer.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.created IS 'Have been created by who';


--
-- Name: COLUMN tm_answer.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_answer.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_answer.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_answer.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_answer.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_answer_id_seq OWNER TO baonguyen;

--
-- Name: tm_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_answer_id_seq OWNED BY public.tm_answer.id;


--
-- Name: tm_answer_tm_question_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_answer_tm_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_answer_tm_question_id_seq OWNER TO baonguyen;

--
-- Name: tm_answer_tm_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_answer_tm_question_id_seq OWNED BY public.tm_answer.tm_question_id;


--
-- Name: tm_category; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_category (
    id bigint NOT NULL,
    tm_category_name character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_category OWNER TO baonguyen;

--
-- Name: TABLE tm_category; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_category IS 'tm_category table';


--
-- Name: COLUMN tm_category.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.id IS 'tm_category ID is a unique value';


--
-- Name: COLUMN tm_category.tm_category_name; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.tm_category_name IS 'The genus of tm_category same like type';


--
-- Name: COLUMN tm_category.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.created IS 'Have been created by who';


--
-- Name: COLUMN tm_category.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_category.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_category.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_category.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_category.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_category_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_category_id_seq OWNER TO baonguyen;

--
-- Name: tm_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_category_id_seq OWNED BY public.tm_category.id;


--
-- Name: tm_comment_rating; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_comment_rating (
    id bigint NOT NULL,
    tm_rating_id bigint NOT NULL,
    tm_comment_template_id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_comment_rating OWNER TO baonguyen;

--
-- Name: TABLE tm_comment_rating; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_comment_rating IS 'Comment and rating table';


--
-- Name: COLUMN tm_comment_rating.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.id IS 'The ID of this table and it is unique';


--
-- Name: COLUMN tm_comment_rating.tm_rating_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.tm_rating_id IS 'A connective value to the rating table';


--
-- Name: COLUMN tm_comment_rating.tm_comment_template_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.tm_comment_template_id IS 'A connective value to the comment_template table';


--
-- Name: COLUMN tm_comment_rating.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.tm_user_id IS 'The users ID take from the users_lesson table because this users must have been learning the lesson';


--
-- Name: COLUMN tm_comment_rating.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.created IS 'Have been created by who';


--
-- Name: COLUMN tm_comment_rating.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_comment_rating.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_comment_rating.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_comment_rating.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_rating.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_comment_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_comment_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_comment_rating_id_seq OWNER TO baonguyen;

--
-- Name: tm_comment_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_comment_rating_id_seq OWNED BY public.tm_comment_rating.id;


--
-- Name: tm_comment_rating_tm_comment_template_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_comment_rating_tm_comment_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_comment_rating_tm_comment_template_id_seq OWNER TO baonguyen;

--
-- Name: tm_comment_rating_tm_comment_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_comment_rating_tm_comment_template_id_seq OWNED BY public.tm_comment_rating.tm_comment_template_id;


--
-- Name: tm_comment_rating_tm_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_comment_rating_tm_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_comment_rating_tm_rating_id_seq OWNER TO baonguyen;

--
-- Name: tm_comment_rating_tm_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_comment_rating_tm_rating_id_seq OWNED BY public.tm_comment_rating.tm_rating_id;


--
-- Name: tm_comment_rating_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_comment_rating_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_comment_rating_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_comment_rating_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_comment_rating_tm_user_id_seq OWNED BY public.tm_comment_rating.tm_user_id;


--
-- Name: tm_comment_template; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_comment_template (
    id bigint NOT NULL,
    comment text,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_comment_template OWNER TO baonguyen;

--
-- Name: TABLE tm_comment_template; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_comment_template IS 'tm_comment_template table';


--
-- Name: COLUMN tm_comment_template.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.id IS 'This is the ID of tm_comment_template table and it is unique, id zero is for optional comment';


--
-- Name: COLUMN tm_comment_template.comment; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.comment IS 'The default comment and the optional comment';


--
-- Name: COLUMN tm_comment_template.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.created IS 'Have been created by who';


--
-- Name: COLUMN tm_comment_template.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_comment_template.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_comment_template.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_comment_template.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_comment_template.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_comment_template_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_comment_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_comment_template_id_seq OWNER TO baonguyen;

--
-- Name: tm_comment_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_comment_template_id_seq OWNED BY public.tm_comment_template.id;


--
-- Name: tm_group; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_group (
    id bigint NOT NULL,
    role character varying(10),
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_group OWNER TO baonguyen;

--
-- Name: TABLE tm_group; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_group IS 'tm_group table';


--
-- Name: COLUMN tm_group.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.id IS 'tm_group ID is a unique value';


--
-- Name: COLUMN tm_group.role; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.role IS 'Type of users teacher or just users';


--
-- Name: COLUMN tm_group.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.created IS 'Have been created by who';


--
-- Name: COLUMN tm_group.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_group.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_group.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_group.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_group.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_group_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_group_id_seq OWNER TO baonguyen;

--
-- Name: tm_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_group_id_seq OWNED BY public.tm_group.id;


--
-- Name: tm_lesson; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_lesson (
    id bigint NOT NULL,
    tm_category_id bigint NOT NULL,
    content_link character varying(100) NOT NULL,
    title text NOT NULL,
    intro text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_lesson OWNER TO baonguyen;

--
-- Name: TABLE tm_lesson; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_lesson IS 'tm_lesson table';


--
-- Name: COLUMN tm_lesson.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.id IS 'tm_lesson ID is a unique value';


--
-- Name: COLUMN tm_lesson.tm_category_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.tm_category_id IS 'tm_category ID is a connective value to tm_category table';


--
-- Name: COLUMN tm_lesson.content_link; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.content_link IS 'The link to the pdf document or a video';


--
-- Name: COLUMN tm_lesson.title; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.title IS 'A title of the tm_lesson';


--
-- Name: COLUMN tm_lesson.intro; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.intro IS 'A script of introduction about the tm_lessons';


--
-- Name: COLUMN tm_lesson.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.created IS 'Have been created by who';


--
-- Name: COLUMN tm_lesson.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_lesson.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_lesson.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_lesson.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_lesson_comment_rating; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_lesson_comment_rating (
    id bigint NOT NULL,
    tm_comment_rating_id bigint NOT NULL,
    tm_lesson_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_lesson_comment_rating OWNER TO baonguyen;

--
-- Name: TABLE tm_lesson_comment_rating; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_lesson_comment_rating IS 'The table between comment_rating table and lesson table';


--
-- Name: COLUMN tm_lesson_comment_rating.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.id IS 'The ID of this table and it is unique';


--
-- Name: COLUMN tm_lesson_comment_rating.tm_comment_rating_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.tm_comment_rating_id IS 'The connective value to the comment_rating table';


--
-- Name: COLUMN tm_lesson_comment_rating.tm_lesson_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.tm_lesson_id IS 'The connective value to the lesson table';


--
-- Name: COLUMN tm_lesson_comment_rating.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.created IS 'Have been created by who';


--
-- Name: COLUMN tm_lesson_comment_rating.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_lesson_comment_rating.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_lesson_comment_rating.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_lesson_comment_rating.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_comment_rating.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_lesson_comment_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_comment_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_comment_rating_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_comment_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_comment_rating_id_seq OWNED BY public.tm_lesson_comment_rating.id;


--
-- Name: tm_lesson_comment_rating_tm_comment_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_comment_rating_tm_comment_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_comment_rating_tm_comment_rating_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_comment_rating_tm_comment_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_comment_rating_tm_comment_rating_id_seq OWNED BY public.tm_lesson_comment_rating.tm_comment_rating_id;


--
-- Name: tm_lesson_comment_rating_tm_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_comment_rating_tm_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_comment_rating_tm_lesson_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_comment_rating_tm_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_comment_rating_tm_lesson_id_seq OWNED BY public.tm_lesson_comment_rating.tm_lesson_id;


--
-- Name: tm_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_id_seq OWNED BY public.tm_lesson.id;


--
-- Name: tm_lesson_tag; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_lesson_tag (
    id bigint NOT NULL,
    tm_lesson_id bigint NOT NULL,
    tm_tag_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_lesson_tag OWNER TO baonguyen;

--
-- Name: TABLE tm_lesson_tag; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_lesson_tag IS 'Lesson and tag table where connect between them';


--
-- Name: COLUMN tm_lesson_tag.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.id IS 'The ID of the lesson and tag table, this is unique value';


--
-- Name: COLUMN tm_lesson_tag.tm_lesson_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.tm_lesson_id IS 'The lesson ID is a connective value to the lesson table';


--
-- Name: COLUMN tm_lesson_tag.tm_tag_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.tm_tag_id IS 'The tag ID is a connective value to the tag table';


--
-- Name: COLUMN tm_lesson_tag.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.created IS 'Have been created by who';


--
-- Name: COLUMN tm_lesson_tag.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_lesson_tag.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_lesson_tag.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_lesson_tag.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_lesson_tag.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_lesson_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_tag_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_tag_id_seq OWNED BY public.tm_lesson_tag.id;


--
-- Name: tm_lesson_tag_tm_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_tag_tm_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_tag_tm_lesson_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_tag_tm_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_tag_tm_lesson_id_seq OWNED BY public.tm_lesson_tag.tm_lesson_id;


--
-- Name: tm_lesson_tag_tm_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_tag_tm_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_tag_tm_tag_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_tag_tm_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_tag_tm_tag_id_seq OWNED BY public.tm_lesson_tag.tm_tag_id;


--
-- Name: tm_lesson_tm_category_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_lesson_tm_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_lesson_tm_category_id_seq OWNER TO baonguyen;

--
-- Name: tm_lesson_tm_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_lesson_tm_category_id_seq OWNED BY public.tm_lesson.tm_category_id;


--
-- Name: tm_question; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_question (
    id bigint NOT NULL,
    tm_test_id bigint NOT NULL,
    question text NOT NULL,
    question_type character varying(20) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_question OWNER TO baonguyen;

--
-- Name: TABLE tm_question; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_question IS 'tm_question table';


--
-- Name: COLUMN tm_question.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.id IS 'tm_question ID is a unique value';


--
-- Name: COLUMN tm_question.tm_test_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.tm_test_id IS 'tm_test ID is a connective value to tm_test table';


--
-- Name: COLUMN tm_question.question; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.question IS 'The question for each sentence';


--
-- Name: COLUMN tm_question.question_type; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.question_type IS 'The type of the question/sentence';


--
-- Name: COLUMN tm_question.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.created IS 'Have been created by who';


--
-- Name: COLUMN tm_question.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_question.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_question.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_question.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_question.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_question_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_question_id_seq OWNER TO baonguyen;

--
-- Name: tm_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_question_id_seq OWNED BY public.tm_question.id;


--
-- Name: tm_question_tm_test_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_question_tm_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_question_tm_test_id_seq OWNER TO baonguyen;

--
-- Name: tm_question_tm_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_question_tm_test_id_seq OWNED BY public.tm_question.tm_test_id;


--
-- Name: tm_rating; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_rating (
    id bigint NOT NULL,
    level integer,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL,
    CONSTRAINT tm_rating_level_check CHECK (((level >= 1) AND (level <= 5)))
);


ALTER TABLE public.tm_rating OWNER TO baonguyen;

--
-- Name: TABLE tm_rating; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_rating IS 'tm_rating table';


--
-- Name: COLUMN tm_rating.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.id IS 'tm_rating ID is unique value';


--
-- Name: COLUMN tm_rating.level; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.level IS 'The level of users rating';


--
-- Name: COLUMN tm_rating.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.created IS 'Have been created by who';


--
-- Name: COLUMN tm_rating.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_rating.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_rating.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_rating.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_rating.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_rating_id_seq OWNER TO baonguyen;

--
-- Name: tm_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_rating_id_seq OWNED BY public.tm_rating.id;


--
-- Name: tm_report; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_report (
    id bigint NOT NULL,
    status character varying(30) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_report OWNER TO baonguyen;

--
-- Name: TABLE tm_report; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_report IS 'tm_report table';


--
-- Name: COLUMN tm_report.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.id IS 'tm_report ID is unique value';


--
-- Name: COLUMN tm_report.status; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.status IS 'The status of users in this lesson(have not done, doing, done)';


--
-- Name: COLUMN tm_report.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.created IS 'Have been created by who';


--
-- Name: COLUMN tm_report.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_report.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_report.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_report.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_report.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_report_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_report_id_seq OWNER TO baonguyen;

--
-- Name: tm_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_report_id_seq OWNED BY public.tm_report.id;


--
-- Name: tm_tag; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_tag (
    id bigint NOT NULL,
    level integer NOT NULL,
    substance character varying(30) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL,
    CONSTRAINT tm_tag_level_check CHECK (((level >= 1) AND (level <= 3)))
);


ALTER TABLE public.tm_tag OWNER TO baonguyen;

--
-- Name: TABLE tm_tag; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_tag IS 'tm_tag table';


--
-- Name: COLUMN tm_tag.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.id IS 'tm_tag ID is a unique value';


--
-- Name: COLUMN tm_tag.level; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.level IS 'The level of the category for a tm_tag from 1 to 3';


--
-- Name: COLUMN tm_tag.substance; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.substance IS 'The content of each tm_tag';


--
-- Name: COLUMN tm_tag.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.created IS 'Have been created by who';


--
-- Name: COLUMN tm_tag.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_tag.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_tag.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_tag.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_tag.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_tag_id_seq OWNER TO baonguyen;

--
-- Name: tm_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_tag_id_seq OWNED BY public.tm_tag.id;


--
-- Name: tm_test; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_test (
    id bigint NOT NULL,
    tm_lesson_id bigint NOT NULL,
    title text NOT NULL,
    rule text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_test OWNER TO baonguyen;

--
-- Name: TABLE tm_test; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_test IS 'tm_test table';


--
-- Name: COLUMN tm_test.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.id IS 'tm_test ID is a unique value';


--
-- Name: COLUMN tm_test.tm_lesson_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.tm_lesson_id IS 'The ID of the tm_lesson from tm_lesson table';


--
-- Name: COLUMN tm_test.title; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.title IS 'A title of the tm_test show what happening in this exam';


--
-- Name: COLUMN tm_test.rule; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.rule IS 'A rule of teacher in this tm_test';


--
-- Name: COLUMN tm_test.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.created IS 'Have been created by who';


--
-- Name: COLUMN tm_test.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_test.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_test.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_test.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_test.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_test_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_test_id_seq OWNER TO baonguyen;

--
-- Name: tm_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_test_id_seq OWNED BY public.tm_test.id;


--
-- Name: tm_test_tm_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_test_tm_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_test_tm_lesson_id_seq OWNER TO baonguyen;

--
-- Name: tm_test_tm_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_test_tm_lesson_id_seq OWNED BY public.tm_test.tm_lesson_id;


--
-- Name: tm_user; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user (
    id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    middle_name character varying(10) NOT NULL,
    last_name character varying(10) NOT NULL,
    national_id character varying(12),
    address character varying(30),
    dob date NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_user OWNER TO baonguyen;

--
-- Name: TABLE tm_user; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user IS ' tm_user table ';


--
-- Name: COLUMN tm_user.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.id IS ' tm_user ID is a unique value ';


--
-- Name: COLUMN tm_user.first_name; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.first_name IS ' First name of tm_user ';


--
-- Name: COLUMN tm_user.middle_name; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.middle_name IS 'Middle name of tm_user';


--
-- Name: COLUMN tm_user.last_name; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.last_name IS ' Last name of tm_user ';


--
-- Name: COLUMN tm_user.national_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.national_id IS 'National ID of tm_user';


--
-- Name: COLUMN tm_user.address; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.address IS 'Home address of tm_user';


--
-- Name: COLUMN tm_user.dob; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.dob IS ' Day of birth of tm_user ';


--
-- Name: COLUMN tm_user.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.created IS ' When have been created ';


--
-- Name: COLUMN tm_user.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.modified IS ' When have been modified ';


--
-- Name: COLUMN tm_user.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.created_by IS ' Have been created by who ';


--
-- Name: COLUMN tm_user.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.modified_by IS ' Have been modified by who ';


--
-- Name: COLUMN tm_user.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_user_answer; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user_answer (
    id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    tm_answer_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_user_answer OWNER TO baonguyen;

--
-- Name: TABLE tm_user_answer; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user_answer IS 'The table of users and those answers';


--
-- Name: COLUMN tm_user_answer.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.id IS 'The ID of this table and this is unique';


--
-- Name: COLUMN tm_user_answer.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.tm_user_id IS 'This users ID is take from the users_test table because the users have answer must have been doing test';


--
-- Name: COLUMN tm_user_answer.tm_answer_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.tm_answer_id IS 'This is the answer ID from the answer table';


--
-- Name: COLUMN tm_user_answer.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.created IS 'Have been created by who';


--
-- Name: COLUMN tm_user_answer.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_user_answer.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_user_answer.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_user_answer.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_answer.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_user_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_answer_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_answer_id_seq OWNED BY public.tm_user_answer.id;


--
-- Name: tm_user_answer_tm_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_answer_tm_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_answer_tm_answer_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_answer_tm_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_answer_tm_answer_id_seq OWNED BY public.tm_user_answer.tm_answer_id;


--
-- Name: tm_user_answer_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_answer_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_answer_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_answer_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_answer_tm_user_id_seq OWNED BY public.tm_user_answer.tm_user_id;


--
-- Name: tm_user_group; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user_group (
    id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    tm_group_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_user_group OWNER TO baonguyen;

--
-- Name: TABLE tm_user_group; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user_group IS 'tm_user_group table';


--
-- Name: COLUMN tm_user_group.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.id IS 'tm_user_group ID is a unique value';


--
-- Name: COLUMN tm_user_group.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.tm_user_id IS 'tm_user ID is a connective value to tm_user table';


--
-- Name: COLUMN tm_user_group.tm_group_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.tm_group_id IS 'tm_group ID is a connective value to tm_group table';


--
-- Name: COLUMN tm_user_group.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.created IS 'Have been created by who';


--
-- Name: COLUMN tm_user_group.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_user_group.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_user_group.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_user_group.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_group.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_group_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_group_id_seq OWNED BY public.tm_user_group.id;


--
-- Name: tm_user_group_tm_group_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_group_tm_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_group_tm_group_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_group_tm_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_group_tm_group_id_seq OWNED BY public.tm_user_group.tm_group_id;


--
-- Name: tm_user_group_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_group_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_group_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_group_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_group_tm_user_id_seq OWNED BY public.tm_user_group.tm_user_id;


--
-- Name: tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_id_seq OWNED BY public.tm_user.id;


--
-- Name: tm_user_lesson; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user_lesson (
    id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    tm_lesson_id bigint NOT NULL,
    tm_report_id bigint NOT NULL,
    view integer NOT NULL,
    time_reading time without time zone NOT NULL,
    evaluation integer,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL,
    CONSTRAINT tm_user_lesson_view_check CHECK ((view >= 0))
);


ALTER TABLE public.tm_user_lesson OWNER TO baonguyen;

--
-- Name: TABLE tm_user_lesson; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user_lesson IS 'users-Lesson table';


--
-- Name: COLUMN tm_user_lesson.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.id IS 'The ID of users and lesson table, this is unique value';


--
-- Name: COLUMN tm_user_lesson.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.tm_user_id IS 'The tm_user ID is a connective value to the users table';


--
-- Name: COLUMN tm_user_lesson.tm_lesson_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.tm_lesson_id IS 'The tm_lesson ID is a connective value to the lesson table';


--
-- Name: COLUMN tm_user_lesson.tm_report_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.tm_report_id IS 'The tm_report ID is a connective value to the report table';


--
-- Name: COLUMN tm_user_lesson.view; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.view IS 'The times that users seeing this lesson';


--
-- Name: COLUMN tm_user_lesson.time_reading; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.time_reading IS 'The total time that the users viewing this lesson';


--
-- Name: COLUMN tm_user_lesson.evaluation; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.evaluation IS 'The comment of the users about the quality of the lesson';


--
-- Name: COLUMN tm_user_lesson.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.created IS 'Have been created by who';


--
-- Name: COLUMN tm_user_lesson.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_user_lesson.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_user_lesson.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_user_lesson.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_lesson.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_user_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_lesson_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_lesson_id_seq OWNED BY public.tm_user_lesson.id;


--
-- Name: tm_user_lesson_tm_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_lesson_tm_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_lesson_tm_lesson_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_lesson_tm_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_lesson_tm_lesson_id_seq OWNED BY public.tm_user_lesson.tm_lesson_id;


--
-- Name: tm_user_lesson_tm_report_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_lesson_tm_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_lesson_tm_report_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_lesson_tm_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_lesson_tm_report_id_seq OWNED BY public.tm_user_lesson.tm_report_id;


--
-- Name: tm_user_lesson_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_lesson_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_lesson_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_lesson_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_lesson_tm_user_id_seq OWNED BY public.tm_user_lesson.tm_user_id;


--
-- Name: tm_user_optional_comment; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user_optional_comment (
    id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    comment text,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_user_optional_comment OWNER TO baonguyen;

--
-- Name: TABLE tm_user_optional_comment; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user_optional_comment IS 'The table of the optional comment of users in the end of the rating';


--
-- Name: COLUMN tm_user_optional_comment.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.id IS 'The ID of this table and this is unique';


--
-- Name: COLUMN tm_user_optional_comment.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.tm_user_id IS 'The user ID from the comment_rating table because this users must have been rated';


--
-- Name: COLUMN tm_user_optional_comment.comment; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.comment IS 'The optional comment of the users';


--
-- Name: COLUMN tm_user_optional_comment.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.created IS 'Have been created by who';


--
-- Name: COLUMN tm_user_optional_comment.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_user_optional_comment.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_user_optional_comment.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_user_optional_comment.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_optional_comment.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_user_optional_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_optional_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_optional_comment_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_optional_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_optional_comment_id_seq OWNED BY public.tm_user_optional_comment.id;


--
-- Name: tm_user_optional_comment_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_optional_comment_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_optional_comment_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_optional_comment_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_optional_comment_tm_user_id_seq OWNED BY public.tm_user_optional_comment.tm_user_id;


--
-- Name: tm_user_test; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user_test (
    id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    tm_test_id bigint NOT NULL,
    score integer,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL,
    CONSTRAINT tm_user_test_score_check CHECK ((score >= 0))
);


ALTER TABLE public.tm_user_test OWNER TO baonguyen;

--
-- Name: TABLE tm_user_test; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user_test IS 'users and test table';


--
-- Name: COLUMN tm_user_test.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.id IS 'The ID of this table and this is unique';


--
-- Name: COLUMN tm_user_test.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.tm_user_id IS 'The user_id from users_lesson that have done the lesson';


--
-- Name: COLUMN tm_user_test.tm_test_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.tm_test_id IS 'The test_id from test table';


--
-- Name: COLUMN tm_user_test.score; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.score IS 'The score of users doing test';


--
-- Name: COLUMN tm_user_test.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.created IS 'Have been created by who';


--
-- Name: COLUMN tm_user_test.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.modified IS 'Have been modified by who';


--
-- Name: COLUMN tm_user_test.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.created_by IS 'Who have been create this table';


--
-- Name: COLUMN tm_user_test.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.modified_by IS 'Who have been modify this table';


--
-- Name: COLUMN tm_user_test.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_test.is_deleted IS 'Have this table been deleted';


--
-- Name: tm_user_test_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_test_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_test_id_seq OWNED BY public.tm_user_test.id;


--
-- Name: tm_user_test_tm_test_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_test_tm_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_test_tm_test_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_test_tm_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_test_tm_test_id_seq OWNED BY public.tm_user_test.tm_test_id;


--
-- Name: tm_user_test_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_test_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_test_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_test_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_test_tm_user_id_seq OWNED BY public.tm_user_test.tm_user_id;


--
-- Name: tm_answer id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_answer ALTER COLUMN id SET DEFAULT nextval('public.tm_answer_id_seq'::regclass);


--
-- Name: tm_answer tm_question_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_answer ALTER COLUMN tm_question_id SET DEFAULT nextval('public.tm_answer_tm_question_id_seq'::regclass);


--
-- Name: tm_category id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_category ALTER COLUMN id SET DEFAULT nextval('public.tm_category_id_seq'::regclass);


--
-- Name: tm_comment_rating id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating ALTER COLUMN id SET DEFAULT nextval('public.tm_comment_rating_id_seq'::regclass);


--
-- Name: tm_comment_rating tm_rating_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating ALTER COLUMN tm_rating_id SET DEFAULT nextval('public.tm_comment_rating_tm_rating_id_seq'::regclass);


--
-- Name: tm_comment_rating tm_comment_template_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating ALTER COLUMN tm_comment_template_id SET DEFAULT nextval('public.tm_comment_rating_tm_comment_template_id_seq'::regclass);


--
-- Name: tm_comment_rating tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_comment_rating_tm_user_id_seq'::regclass);


--
-- Name: tm_comment_template id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_template ALTER COLUMN id SET DEFAULT nextval('public.tm_comment_template_id_seq'::regclass);


--
-- Name: tm_group id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_group ALTER COLUMN id SET DEFAULT nextval('public.tm_group_id_seq'::regclass);


--
-- Name: tm_lesson id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson ALTER COLUMN id SET DEFAULT nextval('public.tm_lesson_id_seq'::regclass);


--
-- Name: tm_lesson tm_category_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson ALTER COLUMN tm_category_id SET DEFAULT nextval('public.tm_lesson_tm_category_id_seq'::regclass);


--
-- Name: tm_lesson_comment_rating id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_comment_rating ALTER COLUMN id SET DEFAULT nextval('public.tm_lesson_comment_rating_id_seq'::regclass);


--
-- Name: tm_lesson_comment_rating tm_comment_rating_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_comment_rating ALTER COLUMN tm_comment_rating_id SET DEFAULT nextval('public.tm_lesson_comment_rating_tm_comment_rating_id_seq'::regclass);


--
-- Name: tm_lesson_comment_rating tm_lesson_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_comment_rating ALTER COLUMN tm_lesson_id SET DEFAULT nextval('public.tm_lesson_comment_rating_tm_lesson_id_seq'::regclass);


--
-- Name: tm_lesson_tag id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_tag ALTER COLUMN id SET DEFAULT nextval('public.tm_lesson_tag_id_seq'::regclass);


--
-- Name: tm_lesson_tag tm_lesson_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_tag ALTER COLUMN tm_lesson_id SET DEFAULT nextval('public.tm_lesson_tag_tm_lesson_id_seq'::regclass);


--
-- Name: tm_lesson_tag tm_tag_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_tag ALTER COLUMN tm_tag_id SET DEFAULT nextval('public.tm_lesson_tag_tm_tag_id_seq'::regclass);


--
-- Name: tm_question id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_question ALTER COLUMN id SET DEFAULT nextval('public.tm_question_id_seq'::regclass);


--
-- Name: tm_question tm_test_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_question ALTER COLUMN tm_test_id SET DEFAULT nextval('public.tm_question_tm_test_id_seq'::regclass);


--
-- Name: tm_rating id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_rating ALTER COLUMN id SET DEFAULT nextval('public.tm_rating_id_seq'::regclass);


--
-- Name: tm_report id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_report ALTER COLUMN id SET DEFAULT nextval('public.tm_report_id_seq'::regclass);


--
-- Name: tm_tag id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_tag ALTER COLUMN id SET DEFAULT nextval('public.tm_tag_id_seq'::regclass);


--
-- Name: tm_test id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_test ALTER COLUMN id SET DEFAULT nextval('public.tm_test_id_seq'::regclass);


--
-- Name: tm_test tm_lesson_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_test ALTER COLUMN tm_lesson_id SET DEFAULT nextval('public.tm_test_tm_lesson_id_seq'::regclass);


--
-- Name: tm_user id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user ALTER COLUMN id SET DEFAULT nextval('public.tm_user_id_seq'::regclass);


--
-- Name: tm_user_answer id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_answer ALTER COLUMN id SET DEFAULT nextval('public.tm_user_answer_id_seq'::regclass);


--
-- Name: tm_user_answer tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_answer ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_user_answer_tm_user_id_seq'::regclass);


--
-- Name: tm_user_answer tm_answer_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_answer ALTER COLUMN tm_answer_id SET DEFAULT nextval('public.tm_user_answer_tm_answer_id_seq'::regclass);


--
-- Name: tm_user_group id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_group ALTER COLUMN id SET DEFAULT nextval('public.tm_user_group_id_seq'::regclass);


--
-- Name: tm_user_group tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_group ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_user_group_tm_user_id_seq'::regclass);


--
-- Name: tm_user_group tm_group_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_group ALTER COLUMN tm_group_id SET DEFAULT nextval('public.tm_user_group_tm_group_id_seq'::regclass);


--
-- Name: tm_user_lesson id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson ALTER COLUMN id SET DEFAULT nextval('public.tm_user_lesson_id_seq'::regclass);


--
-- Name: tm_user_lesson tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_user_lesson_tm_user_id_seq'::regclass);


--
-- Name: tm_user_lesson tm_lesson_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson ALTER COLUMN tm_lesson_id SET DEFAULT nextval('public.tm_user_lesson_tm_lesson_id_seq'::regclass);


--
-- Name: tm_user_lesson tm_report_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson ALTER COLUMN tm_report_id SET DEFAULT nextval('public.tm_user_lesson_tm_report_id_seq'::regclass);


--
-- Name: tm_user_optional_comment id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_optional_comment ALTER COLUMN id SET DEFAULT nextval('public.tm_user_optional_comment_id_seq'::regclass);


--
-- Name: tm_user_optional_comment tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_optional_comment ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_user_optional_comment_tm_user_id_seq'::regclass);


--
-- Name: tm_user_test id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test ALTER COLUMN id SET DEFAULT nextval('public.tm_user_test_id_seq'::regclass);


--
-- Name: tm_user_test tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_user_test_tm_user_id_seq'::regclass);


--
-- Name: tm_user_test tm_test_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test ALTER COLUMN tm_test_id SET DEFAULT nextval('public.tm_user_test_tm_test_id_seq'::regclass);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	0.00	create table user	SQL	V0_00__create_table_user.sql	-1066200456	baonguyen	2024-02-26 23:22:28.589936	14	t
2	0.01	create table group	SQL	V0_01__create_table_group.sql	2063734533	baonguyen	2024-02-26 23:22:28.628598	6	t
3	0.02	create table user group	SQL	V0_02__create_table_user_group.sql	1137920499	baonguyen	2024-02-26 23:22:28.649404	8	t
4	0.03	create table category	SQL	V0_03__create_table_category.sql	241041650	baonguyen	2024-02-26 23:22:28.670575	6	t
5	0.04	create table lesson	SQL	V0_04__create_table_lesson.sql	997001968	baonguyen	2024-02-26 23:22:28.68788	9	t
6	0.05	create table report	SQL	V0_05__create_table_report.sql	1030020285	baonguyen	2024-02-26 23:22:28.708169	7	t
7	0.06	create table test	SQL	V0_06__create_table_test.sql	-574442669	baonguyen	2024-02-26 23:22:28.727004	13	t
8	0.07	create table question	SQL	V0_07__create_table_question.sql	543813973	baonguyen	2024-02-26 23:22:28.752238	13	t
9	0.08	create table answer	SQL	V0_08__create_table_answer.sql	1855411118	baonguyen	2024-02-26 23:22:28.778163	11	t
10	0.09	create table rating	SQL	V0_09__create_table_rating.sql	-905152553	baonguyen	2024-02-26 23:22:28.802381	11	t
11	0.10	create table tag	SQL	V0_10__create_table_tag.sql	868994369	baonguyen	2024-02-26 23:22:28.824133	7	t
12	0.11	create table lesson tag	SQL	V0_11__create_table_lesson_tag.sql	-984451209	baonguyen	2024-02-26 23:22:28.843135	10	t
13	0.12	create table user lesson	SQL	V0_12__create_table_user_lesson.sql	1653663867	baonguyen	2024-02-26 23:22:28.864301	13	t
14	0.13	create table comment template	SQL	V0_13__create_table_comment_template.sql	413073678	baonguyen	2024-02-26 23:22:28.89152	10	t
15	0.14	create table comment rating	SQL	V0_14__create_table_comment_rating.sql	-1732792967	baonguyen	2024-02-26 23:22:28.911419	12	t
16	0.15	create table lesson comment rating	SQL	V0_15__create_table_lesson_comment_rating.sql	-1633500774	baonguyen	2024-02-26 23:22:28.935944	10	t
17	0.16	create table user test	SQL	V0_16__create_table_user_test.sql	-431206155	baonguyen	2024-02-26 23:22:28.960165	14	t
18	0.17	create table user optional comment	SQL	V0_17__create_table_user_optional_comment.sql	-1996574202	baonguyen	2024-02-26 23:22:28.987457	11	t
19	0.18	create table user answer	SQL	V0_18__create_table_user_answer.sql	-1391813846	baonguyen	2024-02-26 23:22:29.011828	9	t
\.


--
-- Data for Name: tm_answer; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_answer (id, answer, tm_question_id, is_correct, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_category; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_category (id, tm_category_name, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_comment_rating; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_comment_rating (id, tm_rating_id, tm_comment_template_id, tm_user_id, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_comment_template; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_comment_template (id, comment, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_group; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_group (id, role, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_lesson; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_lesson (id, tm_category_id, content_link, title, intro, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_lesson_comment_rating; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_lesson_comment_rating (id, tm_comment_rating_id, tm_lesson_id, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_lesson_tag; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_lesson_tag (id, tm_lesson_id, tm_tag_id, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_question; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_question (id, tm_test_id, question, question_type, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_rating; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_rating (id, level, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_report; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_report (id, status, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_tag; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_tag (id, level, substance, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_test; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_test (id, tm_lesson_id, title, rule, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_user; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user (id, first_name, middle_name, last_name, national_id, address, dob, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_user_answer; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user_answer (id, tm_user_id, tm_answer_id, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_user_group; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user_group (id, tm_user_id, tm_group_id, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_user_lesson; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user_lesson (id, tm_user_id, tm_lesson_id, tm_report_id, view, time_reading, evaluation, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_user_optional_comment; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user_optional_comment (id, tm_user_id, comment, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Data for Name: tm_user_test; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user_test (id, tm_user_id, tm_test_id, score, created, modified, created_by, modified_by, is_deleted) FROM stdin;
\.


--
-- Name: tm_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_answer_id_seq', 1, false);


--
-- Name: tm_answer_tm_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_answer_tm_question_id_seq', 1, false);


--
-- Name: tm_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_category_id_seq', 1, false);


--
-- Name: tm_comment_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_comment_rating_id_seq', 1, false);


--
-- Name: tm_comment_rating_tm_comment_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_comment_rating_tm_comment_template_id_seq', 1, false);


--
-- Name: tm_comment_rating_tm_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_comment_rating_tm_rating_id_seq', 1, false);


--
-- Name: tm_comment_rating_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_comment_rating_tm_user_id_seq', 1, false);


--
-- Name: tm_comment_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_comment_template_id_seq', 1, false);


--
-- Name: tm_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_group_id_seq', 1, false);


--
-- Name: tm_lesson_comment_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_comment_rating_id_seq', 1, false);


--
-- Name: tm_lesson_comment_rating_tm_comment_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_comment_rating_tm_comment_rating_id_seq', 1, false);


--
-- Name: tm_lesson_comment_rating_tm_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_comment_rating_tm_lesson_id_seq', 1, false);


--
-- Name: tm_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_id_seq', 1, false);


--
-- Name: tm_lesson_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_tag_id_seq', 1, false);


--
-- Name: tm_lesson_tag_tm_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_tag_tm_lesson_id_seq', 1, false);


--
-- Name: tm_lesson_tag_tm_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_tag_tm_tag_id_seq', 1, false);


--
-- Name: tm_lesson_tm_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_lesson_tm_category_id_seq', 1, false);


--
-- Name: tm_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_question_id_seq', 1, false);


--
-- Name: tm_question_tm_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_question_tm_test_id_seq', 1, false);


--
-- Name: tm_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_rating_id_seq', 1, false);


--
-- Name: tm_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_report_id_seq', 1, false);


--
-- Name: tm_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_tag_id_seq', 1, false);


--
-- Name: tm_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_test_id_seq', 1, false);


--
-- Name: tm_test_tm_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_test_tm_lesson_id_seq', 1, false);


--
-- Name: tm_user_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_answer_id_seq', 1, false);


--
-- Name: tm_user_answer_tm_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_answer_tm_answer_id_seq', 1, false);


--
-- Name: tm_user_answer_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_answer_tm_user_id_seq', 1, false);


--
-- Name: tm_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_group_id_seq', 1, false);


--
-- Name: tm_user_group_tm_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_group_tm_group_id_seq', 1, false);


--
-- Name: tm_user_group_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_group_tm_user_id_seq', 1, false);


--
-- Name: tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_id_seq', 1, false);


--
-- Name: tm_user_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_lesson_id_seq', 1, false);


--
-- Name: tm_user_lesson_tm_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_lesson_tm_lesson_id_seq', 1, false);


--
-- Name: tm_user_lesson_tm_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_lesson_tm_report_id_seq', 1, false);


--
-- Name: tm_user_lesson_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_lesson_tm_user_id_seq', 1, false);


--
-- Name: tm_user_optional_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_optional_comment_id_seq', 1, false);


--
-- Name: tm_user_optional_comment_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_optional_comment_tm_user_id_seq', 1, false);


--
-- Name: tm_user_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_test_id_seq', 1, false);


--
-- Name: tm_user_test_tm_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_test_tm_test_id_seq', 1, false);


--
-- Name: tm_user_test_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_test_tm_user_id_seq', 1, false);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: tm_answer tm_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_answer
    ADD CONSTRAINT tm_answer_pkey PRIMARY KEY (id);


--
-- Name: tm_category tm_category_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_category
    ADD CONSTRAINT tm_category_pkey PRIMARY KEY (id);


--
-- Name: tm_comment_rating tm_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating
    ADD CONSTRAINT tm_comment_rating_pkey PRIMARY KEY (id);


--
-- Name: tm_comment_rating tm_comment_rating_tm_user_id_key; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating
    ADD CONSTRAINT tm_comment_rating_tm_user_id_key UNIQUE (tm_user_id);


--
-- Name: tm_comment_template tm_comment_template_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_template
    ADD CONSTRAINT tm_comment_template_pkey PRIMARY KEY (id);


--
-- Name: tm_group tm_group_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_group
    ADD CONSTRAINT tm_group_pkey PRIMARY KEY (id);


--
-- Name: tm_lesson_comment_rating tm_lesson_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_comment_rating
    ADD CONSTRAINT tm_lesson_comment_rating_pkey PRIMARY KEY (id);


--
-- Name: tm_lesson tm_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson
    ADD CONSTRAINT tm_lesson_pkey PRIMARY KEY (id);


--
-- Name: tm_lesson_tag tm_lesson_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_tag
    ADD CONSTRAINT tm_lesson_tag_pkey PRIMARY KEY (id);


--
-- Name: tm_question tm_question_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_question
    ADD CONSTRAINT tm_question_pkey PRIMARY KEY (id);


--
-- Name: tm_rating tm_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_rating
    ADD CONSTRAINT tm_rating_pkey PRIMARY KEY (id);


--
-- Name: tm_report tm_report_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_report
    ADD CONSTRAINT tm_report_pkey PRIMARY KEY (id);


--
-- Name: tm_tag tm_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_tag
    ADD CONSTRAINT tm_tag_pkey PRIMARY KEY (id);


--
-- Name: tm_test tm_test_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_test
    ADD CONSTRAINT tm_test_pkey PRIMARY KEY (id);


--
-- Name: tm_user_answer tm_user_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_answer
    ADD CONSTRAINT tm_user_answer_pkey PRIMARY KEY (id);


--
-- Name: tm_user_group tm_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_group
    ADD CONSTRAINT tm_user_group_pkey PRIMARY KEY (id);


--
-- Name: tm_user_lesson tm_user_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson
    ADD CONSTRAINT tm_user_lesson_pkey PRIMARY KEY (id);


--
-- Name: tm_user_lesson tm_user_lesson_tm_user_id_key; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson
    ADD CONSTRAINT tm_user_lesson_tm_user_id_key UNIQUE (tm_user_id);


--
-- Name: tm_user_optional_comment tm_user_optional_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_optional_comment
    ADD CONSTRAINT tm_user_optional_comment_pkey PRIMARY KEY (id);


--
-- Name: tm_user tm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user
    ADD CONSTRAINT tm_user_pkey PRIMARY KEY (id);


--
-- Name: tm_user_test tm_user_test_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test
    ADD CONSTRAINT tm_user_test_pkey PRIMARY KEY (id);


--
-- Name: tm_user_test tm_user_test_tm_user_id_key; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test
    ADD CONSTRAINT tm_user_test_tm_user_id_key UNIQUE (tm_user_id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: baonguyen
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: tm_user_answer fk_tm_answer_id_tm_user_answer; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_answer
    ADD CONSTRAINT fk_tm_answer_id_tm_user_answer FOREIGN KEY (tm_answer_id) REFERENCES public.tm_answer(id);


--
-- Name: tm_lesson fk_tm_category_id_tm_lesson; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson
    ADD CONSTRAINT fk_tm_category_id_tm_lesson FOREIGN KEY (tm_category_id) REFERENCES public.tm_category(id);


--
-- Name: tm_lesson_comment_rating fk_tm_comment_rating_id_tm_lesson_comment_rating; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_comment_rating
    ADD CONSTRAINT fk_tm_comment_rating_id_tm_lesson_comment_rating FOREIGN KEY (tm_comment_rating_id) REFERENCES public.tm_comment_rating(id);


--
-- Name: tm_comment_rating fk_tm_comment_template_id_tm_comment_rating; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating
    ADD CONSTRAINT fk_tm_comment_template_id_tm_comment_rating FOREIGN KEY (tm_comment_template_id) REFERENCES public.tm_comment_template(id);


--
-- Name: tm_user_group fk_tm_group_id_tm_user_group; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_group
    ADD CONSTRAINT fk_tm_group_id_tm_user_group FOREIGN KEY (tm_group_id) REFERENCES public.tm_group(id);


--
-- Name: tm_lesson_comment_rating fk_tm_lesson_id_tm_lesson_comment_rating; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_comment_rating
    ADD CONSTRAINT fk_tm_lesson_id_tm_lesson_comment_rating FOREIGN KEY (tm_lesson_id) REFERENCES public.tm_lesson(id);


--
-- Name: tm_lesson_tag fk_tm_lesson_id_tm_lesson_tag; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_tag
    ADD CONSTRAINT fk_tm_lesson_id_tm_lesson_tag FOREIGN KEY (tm_lesson_id) REFERENCES public.tm_lesson(id);


--
-- Name: tm_test fk_tm_lesson_id_tm_test; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_test
    ADD CONSTRAINT fk_tm_lesson_id_tm_test FOREIGN KEY (tm_lesson_id) REFERENCES public.tm_lesson(id);


--
-- Name: tm_user_lesson fk_tm_lesson_id_tm_user_lesson; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson
    ADD CONSTRAINT fk_tm_lesson_id_tm_user_lesson FOREIGN KEY (tm_lesson_id) REFERENCES public.tm_lesson(id);


--
-- Name: tm_answer fk_tm_question_id_tm_answer; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_answer
    ADD CONSTRAINT fk_tm_question_id_tm_answer FOREIGN KEY (tm_question_id) REFERENCES public.tm_question(id);


--
-- Name: tm_comment_rating fk_tm_rating_id_tm_comment_rating; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating
    ADD CONSTRAINT fk_tm_rating_id_tm_comment_rating FOREIGN KEY (tm_rating_id) REFERENCES public.tm_rating(id);


--
-- Name: tm_user_lesson fk_tm_report_id_tm_user_lesson; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson
    ADD CONSTRAINT fk_tm_report_id_tm_user_lesson FOREIGN KEY (tm_report_id) REFERENCES public.tm_report(id);


--
-- Name: tm_lesson_tag fk_tm_tag_id_tm_lesson_tag; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_lesson_tag
    ADD CONSTRAINT fk_tm_tag_id_tm_lesson_tag FOREIGN KEY (tm_tag_id) REFERENCES public.tm_tag(id);


--
-- Name: tm_question fk_tm_test_id_tm_question; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_question
    ADD CONSTRAINT fk_tm_test_id_tm_question FOREIGN KEY (tm_test_id) REFERENCES public.tm_test(id);


--
-- Name: tm_user_test fk_tm_test_id_tm_user_test; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test
    ADD CONSTRAINT fk_tm_test_id_tm_user_test FOREIGN KEY (tm_test_id) REFERENCES public.tm_test(id);


--
-- Name: tm_comment_rating fk_tm_user_id_tm_comment_rating; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_comment_rating
    ADD CONSTRAINT fk_tm_user_id_tm_comment_rating FOREIGN KEY (tm_user_id) REFERENCES public.tm_user_lesson(tm_user_id);


--
-- Name: tm_user_answer fk_tm_user_id_tm_user_answer; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_answer
    ADD CONSTRAINT fk_tm_user_id_tm_user_answer FOREIGN KEY (tm_user_id) REFERENCES public.tm_user_test(tm_user_id);


--
-- Name: tm_user_group fk_tm_user_id_tm_user_group; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_group
    ADD CONSTRAINT fk_tm_user_id_tm_user_group FOREIGN KEY (tm_user_id) REFERENCES public.tm_user(id);


--
-- Name: tm_user_lesson fk_tm_user_id_tm_user_lesson; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_lesson
    ADD CONSTRAINT fk_tm_user_id_tm_user_lesson FOREIGN KEY (tm_user_id) REFERENCES public.tm_user(id);


--
-- Name: tm_user_optional_comment fk_tm_user_id_tm_user_optional_comment; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_optional_comment
    ADD CONSTRAINT fk_tm_user_id_tm_user_optional_comment FOREIGN KEY (tm_user_id) REFERENCES public.tm_comment_rating(tm_user_id);


--
-- Name: tm_user_test fk_tm_user_id_tm_user_test; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_test
    ADD CONSTRAINT fk_tm_user_id_tm_user_test FOREIGN KEY (tm_user_id) REFERENCES public.tm_user_lesson(tm_user_id);


--
-- PostgreSQL database dump complete
--

