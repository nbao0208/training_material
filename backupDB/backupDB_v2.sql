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
-- Name: tm_user_account; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.tm_user_account (
    id bigint NOT NULL,
    tm_user_id bigint NOT NULL,
    account text NOT NULL,
    password text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by character varying(30) NOT NULL,
    modified_by character varying(30) NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.tm_user_account OWNER TO baonguyen;

--
-- Name: TABLE tm_user_account; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.tm_user_account IS 'This is table for user account';


--
-- Name: COLUMN tm_user_account.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_account.id IS 'This is the id of this table and it is unique';


--
-- Name: COLUMN tm_user_account.tm_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_account.tm_user_id IS 'This is the user_id from tm_user table';


--
-- Name: COLUMN tm_user_account.account; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_account.account IS 'This is the account of the user';


--
-- Name: COLUMN tm_user_account.password; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.tm_user_account.password IS 'The password of the user account';


--
-- Name: tm_user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_account_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_account_id_seq OWNED BY public.tm_user_account.id;


--
-- Name: tm_user_account_tm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.tm_user_account_tm_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tm_user_account_tm_user_id_seq OWNER TO baonguyen;

--
-- Name: tm_user_account_tm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.tm_user_account_tm_user_id_seq OWNED BY public.tm_user_account.tm_user_id;


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
-- Name: tm_user_account id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_account ALTER COLUMN id SET DEFAULT nextval('public.tm_user_account_id_seq'::regclass);


--
-- Name: tm_user_account tm_user_id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_account ALTER COLUMN tm_user_id SET DEFAULT nextval('public.tm_user_account_tm_user_id_seq'::regclass);


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
1	0.00	create table user	SQL	V0_00__create_table_user.sql	-1066200456	baonguyen	2024-03-14 19:22:27.196712	43	t
2	0.01	create table group	SQL	V0_01__create_table_group.sql	2063734533	baonguyen	2024-03-14 19:22:27.270328	7	t
3	0.02	create table user group	SQL	V0_02__create_table_user_group.sql	-1506614836	baonguyen	2024-03-14 19:22:27.291969	11	t
4	0.03	create table category	SQL	V0_03__create_table_category.sql	241041650	baonguyen	2024-03-14 19:22:27.315629	5	t
5	0.04	create table lesson	SQL	V0_04__create_table_lesson.sql	997001968	baonguyen	2024-03-14 19:22:27.331569	7	t
6	0.05	create table report	SQL	V0_05__create_table_report.sql	1030020285	baonguyen	2024-03-14 19:22:27.34789	5	t
7	0.06	create table test	SQL	V0_06__create_table_test.sql	-574442669	baonguyen	2024-03-14 19:22:27.36084	8	t
8	0.07	create table question	SQL	V0_07__create_table_question.sql	543813973	baonguyen	2024-03-14 19:22:27.377081	6	t
9	0.08	create table answer	SQL	V0_08__create_table_answer.sql	1855411118	baonguyen	2024-03-14 19:22:27.390891	8	t
10	0.09	create table rating	SQL	V0_09__create_table_rating.sql	-905152553	baonguyen	2024-03-14 19:22:27.410431	7	t
11	0.10	create table tag	SQL	V0_10__create_table_tag.sql	868994369	baonguyen	2024-03-14 19:22:27.429326	9	t
12	0.11	create table lesson tag	SQL	V0_11__create_table_lesson_tag.sql	-984451209	baonguyen	2024-03-14 19:22:27.451862	10	t
13	0.12	create table user lesson	SQL	V0_12__create_table_user_lesson.sql	1653663867	baonguyen	2024-03-14 19:22:27.472499	11	t
14	0.13	create table comment template	SQL	V0_13__create_table_comment_template.sql	413073678	baonguyen	2024-03-14 19:22:27.496975	10	t
15	0.14	create table comment rating	SQL	V0_14__create_table_comment_rating.sql	-1732792967	baonguyen	2024-03-14 19:22:27.516376	10	t
16	0.15	create table lesson comment rating	SQL	V0_15__create_table_lesson_comment_rating.sql	-1633500774	baonguyen	2024-03-14 19:22:27.539156	7	t
17	0.16	create table user test	SQL	V0_16__create_table_user_test.sql	-431206155	baonguyen	2024-03-14 19:22:27.558375	9	t
18	0.17	create table user optional comment	SQL	V0_17__create_table_user_optional_comment.sql	-1996574202	baonguyen	2024-03-14 19:22:27.576729	7	t
19	0.18	create table user answer	SQL	V0_18__create_table_user_answer.sql	-1391813846	baonguyen	2024-03-14 19:22:27.592734	6	t
20	0.19	create table user account	SQL	V0_19__create_table_user_account.sql	901097481	baonguyen	2024-03-14 19:22:27.607592	8	t
\.


--
-- Data for Name: tm_answer; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_answer (id, answer, tm_question_id, is_correct, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	câu trả lời 1	3	t	2024-03-14 15:33:04.681538+00	2024-03-14 15:33:04.681569+00	Bao Nguyen	Bao Nguyen	f
2	câu trả lời 2	3	f	2024-03-14 15:33:04.68704+00	2024-03-14 15:33:04.687059+00	Bao Nguyen	Bao Nguyen	f
3	câu trả lời 3	3	f	2024-03-14 15:33:04.69255+00	2024-03-14 15:33:04.692566+00	Bao Nguyen	Bao Nguyen	f
4	câu trả lời 1	4	f	2024-03-14 15:33:04.69865+00	2024-03-14 15:33:04.698671+00	Bao Nguyen	Bao Nguyen	f
5	câu trả lời 2	4	t	2024-03-14 15:33:04.703272+00	2024-03-14 15:33:04.703288+00	Bao Nguyen	Bao Nguyen	f
\.


--
-- Data for Name: tm_category; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_category (id, tm_category_name, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	dành cho người mới	2024-03-14 12:24:51.150084+00	2024-03-14 12:24:51.150084+00	bao nguyen	bao nguyen	f
2	hiểu về sản phẩm	2024-03-14 12:24:51.150084+00	2024-03-14 12:24:51.150084+00	bao nguyen	bao nguyen	f
3	hướng dẫn thao tác	2024-03-14 12:24:51.150084+00	2024-03-14 12:24:51.150084+00	bao nguyen	bao nguyen	f
4	kỹ năng bán hàng	2024-03-14 12:24:51.150084+00	2024-03-14 12:24:51.150084+00	bao nguyen	bao nguyen	f
5	tài liệu tham khảo	2024-03-14 12:24:51.150084+00	2024-03-14 12:24:51.150084+00	bao nguyen	bao nguyen	f
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
1	student	2024-03-14 12:24:16.329321+00	2024-03-14 12:24:16.329321+00	bao nguyen	bao nguyen	f
2	teacher	2024-03-14 12:24:16.329321+00	2024-03-14 12:24:16.329321+00	bao nguyen	bao nguyen	f
\.


--
-- Data for Name: tm_lesson; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_lesson (id, tm_category_id, content_link, title, intro, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	2	/tm_lesson_content_link_1	tm_lesson 1	Introduction to tm_lesson 1	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
2	2	/tm_lesson_content_link_2	tm_lesson 2	Introduction to tm_lesson 2	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
3	2	/tm_lesson_content_link_3	tm_lesson 3	Introduction to tm_lesson 3	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
4	2	/tm_lesson_content_link_4	tm_lesson 4	Introduction to tm_lesson 4	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
5	2	/tm_lesson_content_link_5	tm_lesson 5	Introduction to tm_lesson 5	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
6	2	/tm_lesson_content_link_6	tm_lesson 6	Introduction to tm_lesson 6	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
7	2	/tm_lesson_content_link_7	tm_lesson 7	Introduction to tm_lesson 7	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
8	2	/tm_lesson_content_link_8	tm_lesson 8	Introduction to tm_lesson 8	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
9	2	/tm_lesson_content_link_9	tm_lesson 9	Introduction to tm_lesson 9	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
10	2	/tm_lesson_content_link_10	tm_lesson 10	Introduction to tm_lesson 10	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
11	2	/tm_lesson_content_link_11	tm_lesson 11	Introduction to tm_lesson 11	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
12	2	/tm_lesson_content_link_12	tm_lesson 12	Introduction to tm_lesson 12	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
13	2	/tm_lesson_content_link_13	tm_lesson 13	Introduction to tm_lesson 13	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
14	2	/tm_lesson_content_link_14	tm_lesson 14	Introduction to tm_lesson 14	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
15	2	/tm_lesson_content_link_15	tm_lesson 15	Introduction to tm_lesson 15	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
16	2	/tm_lesson_content_link_16	tm_lesson 16	Introduction to tm_lesson 16	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
17	2	/tm_lesson_content_link_17	tm_lesson 17	Introduction to tm_lesson 17	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
18	2	/tm_lesson_content_link_18	tm_lesson 18	Introduction to tm_lesson 18	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
19	2	/tm_lesson_content_link_19	tm_lesson 19	Introduction to tm_lesson 19	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
20	2	/tm_lesson_content_link_20	tm_lesson 20	Introduction to tm_lesson 20	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
21	2	/tm_lesson_content_link_21	tm_lesson 21	Introduction to tm_lesson 21	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
22	2	/tm_lesson_content_link_22	tm_lesson 22	Introduction to tm_lesson 22	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
23	2	/tm_lesson_content_link_23	tm_lesson 23	Introduction to tm_lesson 23	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
24	2	/tm_lesson_content_link_24	tm_lesson 24	Introduction to tm_lesson 24	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
25	2	/tm_lesson_content_link_25	tm_lesson 25	Introduction to tm_lesson 25	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
26	2	/tm_lesson_content_link_26	tm_lesson 26	Introduction to tm_lesson 26	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
27	2	/tm_lesson_content_link_27	tm_lesson 27	Introduction to tm_lesson 27	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
28	2	/tm_lesson_content_link_28	tm_lesson 28	Introduction to tm_lesson 28	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
29	2	/tm_lesson_content_link_29	tm_lesson 29	Introduction to tm_lesson 29	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
30	2	/tm_lesson_content_link_30	tm_lesson 30	Introduction to tm_lesson 30	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
31	2	/tm_lesson_content_link_31	tm_lesson 31	Introduction to tm_lesson 31	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
32	2	/tm_lesson_content_link_32	tm_lesson 32	Introduction to tm_lesson 32	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
33	2	/tm_lesson_content_link_33	tm_lesson 33	Introduction to tm_lesson 33	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
34	2	/tm_lesson_content_link_34	tm_lesson 34	Introduction to tm_lesson 34	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
35	2	/tm_lesson_content_link_35	tm_lesson 35	Introduction to tm_lesson 35	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
36	2	/tm_lesson_content_link_36	tm_lesson 36	Introduction to tm_lesson 36	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
37	2	/tm_lesson_content_link_37	tm_lesson 37	Introduction to tm_lesson 37	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
38	2	/tm_lesson_content_link_38	tm_lesson 38	Introduction to tm_lesson 38	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
39	2	/tm_lesson_content_link_39	tm_lesson 39	Introduction to tm_lesson 39	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
40	2	/tm_lesson_content_link_40	tm_lesson 40	Introduction to tm_lesson 40	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
41	2	/tm_lesson_content_link_41	tm_lesson 41	Introduction to tm_lesson 41	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
42	2	/tm_lesson_content_link_42	tm_lesson 42	Introduction to tm_lesson 42	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
43	2	/tm_lesson_content_link_43	tm_lesson 43	Introduction to tm_lesson 43	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
44	2	/tm_lesson_content_link_44	tm_lesson 44	Introduction to tm_lesson 44	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
45	2	/tm_lesson_content_link_45	tm_lesson 45	Introduction to tm_lesson 45	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
46	2	/tm_lesson_content_link_46	tm_lesson 46	Introduction to tm_lesson 46	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
47	2	/tm_lesson_content_link_47	tm_lesson 47	Introduction to tm_lesson 47	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
48	2	/tm_lesson_content_link_48	tm_lesson 48	Introduction to tm_lesson 48	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
49	2	/tm_lesson_content_link_49	tm_lesson 49	Introduction to tm_lesson 49	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
50	2	/tm_lesson_content_link_50	tm_lesson 50	Introduction to tm_lesson 50	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
51	2	/tm_lesson_content_link_51	tm_lesson 51	Introduction to tm_lesson 51	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
52	2	/tm_lesson_content_link_52	tm_lesson 52	Introduction to tm_lesson 52	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
53	2	/tm_lesson_content_link_53	tm_lesson 53	Introduction to tm_lesson 53	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
54	2	/tm_lesson_content_link_54	tm_lesson 54	Introduction to tm_lesson 54	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
55	2	/tm_lesson_content_link_55	tm_lesson 55	Introduction to tm_lesson 55	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
56	2	/tm_lesson_content_link_56	tm_lesson 56	Introduction to tm_lesson 56	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
57	2	/tm_lesson_content_link_57	tm_lesson 57	Introduction to tm_lesson 57	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
58	2	/tm_lesson_content_link_58	tm_lesson 58	Introduction to tm_lesson 58	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
59	2	/tm_lesson_content_link_59	tm_lesson 59	Introduction to tm_lesson 59	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
60	2	/tm_lesson_content_link_60	tm_lesson 60	Introduction to tm_lesson 60	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
61	2	/tm_lesson_content_link_61	tm_lesson 61	Introduction to tm_lesson 61	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
62	2	/tm_lesson_content_link_62	tm_lesson 62	Introduction to tm_lesson 62	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
63	2	/tm_lesson_content_link_63	tm_lesson 63	Introduction to tm_lesson 63	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
64	2	/tm_lesson_content_link_64	tm_lesson 64	Introduction to tm_lesson 64	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
65	2	/tm_lesson_content_link_65	tm_lesson 65	Introduction to tm_lesson 65	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
66	2	/tm_lesson_content_link_66	tm_lesson 66	Introduction to tm_lesson 66	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
67	2	/tm_lesson_content_link_67	tm_lesson 67	Introduction to tm_lesson 67	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
68	2	/tm_lesson_content_link_68	tm_lesson 68	Introduction to tm_lesson 68	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
69	2	/tm_lesson_content_link_69	tm_lesson 69	Introduction to tm_lesson 69	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
70	2	/tm_lesson_content_link_70	tm_lesson 70	Introduction to tm_lesson 70	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
71	2	/tm_lesson_content_link_71	tm_lesson 71	Introduction to tm_lesson 71	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
72	2	/tm_lesson_content_link_72	tm_lesson 72	Introduction to tm_lesson 72	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
73	2	/tm_lesson_content_link_73	tm_lesson 73	Introduction to tm_lesson 73	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
74	2	/tm_lesson_content_link_74	tm_lesson 74	Introduction to tm_lesson 74	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
75	2	/tm_lesson_content_link_75	tm_lesson 75	Introduction to tm_lesson 75	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
76	2	/tm_lesson_content_link_76	tm_lesson 76	Introduction to tm_lesson 76	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
77	2	/tm_lesson_content_link_77	tm_lesson 77	Introduction to tm_lesson 77	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
78	2	/tm_lesson_content_link_78	tm_lesson 78	Introduction to tm_lesson 78	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
79	2	/tm_lesson_content_link_79	tm_lesson 79	Introduction to tm_lesson 79	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
80	2	/tm_lesson_content_link_80	tm_lesson 80	Introduction to tm_lesson 80	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
81	2	/tm_lesson_content_link_81	tm_lesson 81	Introduction to tm_lesson 81	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
82	2	/tm_lesson_content_link_82	tm_lesson 82	Introduction to tm_lesson 82	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
83	2	/tm_lesson_content_link_83	tm_lesson 83	Introduction to tm_lesson 83	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
84	2	/tm_lesson_content_link_84	tm_lesson 84	Introduction to tm_lesson 84	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
85	2	/tm_lesson_content_link_85	tm_lesson 85	Introduction to tm_lesson 85	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
86	2	/tm_lesson_content_link_86	tm_lesson 86	Introduction to tm_lesson 86	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
87	2	/tm_lesson_content_link_87	tm_lesson 87	Introduction to tm_lesson 87	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
88	2	/tm_lesson_content_link_88	tm_lesson 88	Introduction to tm_lesson 88	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
89	2	/tm_lesson_content_link_89	tm_lesson 89	Introduction to tm_lesson 89	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
90	2	/tm_lesson_content_link_90	tm_lesson 90	Introduction to tm_lesson 90	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
91	2	/tm_lesson_content_link_91	tm_lesson 91	Introduction to tm_lesson 91	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
92	2	/tm_lesson_content_link_92	tm_lesson 92	Introduction to tm_lesson 92	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
93	2	/tm_lesson_content_link_93	tm_lesson 93	Introduction to tm_lesson 93	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
94	2	/tm_lesson_content_link_94	tm_lesson 94	Introduction to tm_lesson 94	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
95	2	/tm_lesson_content_link_95	tm_lesson 95	Introduction to tm_lesson 95	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
96	2	/tm_lesson_content_link_96	tm_lesson 96	Introduction to tm_lesson 96	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
97	2	/tm_lesson_content_link_97	tm_lesson 97	Introduction to tm_lesson 97	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
98	2	/tm_lesson_content_link_98	tm_lesson 98	Introduction to tm_lesson 98	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
99	2	/tm_lesson_content_link_99	tm_lesson 99	Introduction to tm_lesson 99	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
100	2	/tm_lesson_content_link_100	tm_lesson 100	Introduction to tm_lesson 100	2024-03-14 12:25:13.69985+00	2024-03-14 12:25:13.69985+00	bao nguyen	bao nguyen	f
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
1	1	Câu hỏi 1	Loại câu hỏi 1	2024-03-14 12:30:26.460101+00	2024-03-14 12:30:26.460118+00	Bao Nguyen	Bao Nguyen	f
2	1	Câu hỏi 2	Loại câu hỏi 2	2024-03-14 12:30:26.465109+00	2024-03-14 12:30:26.465142+00	Bao Nguyen	Bao Nguyen	f
3	2	Câu hỏi 2	Loại câu hỏi 2	2024-03-14 15:33:04.677577+00	2024-03-14 15:33:04.677594+00	Bao Nguyen	Bao Nguyen	f
4	2	Câu hỏi 2	Loại câu hỏi 3	2024-03-14 15:33:04.695583+00	2024-03-14 15:33:04.695597+00	Bao Nguyen	Bao Nguyen	f
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
1	have not done	2024-03-14 12:25:28.79937+00	2024-03-14 12:25:28.79937+00	bao nguyen	bao nguyen	f
2	doing	2024-03-14 12:25:28.79937+00	2024-03-14 12:25:28.79937+00	bao nguyen	bao nguyen	f
3	done	2024-03-14 12:25:28.79937+00	2024-03-14 12:25:28.79937+00	bao nguyen	bao nguyen	f
\.


--
-- Data for Name: tm_tag; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_tag (id, level, substance, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	1	Beginner	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
2	2	Intermediate	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
3	3	Advanced	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
4	1	Basic	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
5	2	Elementary	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
6	3	Proficient	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
7	1	Novice	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
8	2	Skilled	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
9	3	Expert	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
10	1	Fundamental	2024-03-14 12:27:04.340851+00	2024-03-14 12:27:04.340851+00	bao nguyen	bao nguyen	f
\.


--
-- Data for Name: tm_test; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_test (id, tm_lesson_id, title, rule, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	1	Tiêu đề	Quy định	2024-03-14 12:30:26.415942+00	2024-03-14 12:30:26.415962+00	Bao Nguyen	Bao Nguyen	f
2	1	Tiêu đề	Quy định	2024-03-14 15:33:04.636679+00	2024-03-14 15:33:04.636698+00	Bao Nguyen	Bao Nguyen	f
\.


--
-- Data for Name: tm_user; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user (id, first_name, middle_name, last_name, national_id, address, dob, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	John	A	Doe	1234567890	123 Main St	1985-05-10	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
2	Jane	B	Smith	0987654321	456 Oak Ave	1990-12-15	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
3	Michael	C	Johnson	5678901234	789 Elm St	1978-09-20	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
4	Alice	D	Williams	3456789012	321 Pine St	1982-03-25	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
5	Robert	E	Brown	4567890123	654 Birch Ave	1995-07-30	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
6	Emily	F	Jones	7890123456	987 Cedar St	1987-11-05	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
7	William	G	Davis	8901234567	753 Maple St	1992-02-18	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
8	Mary	H	Miller	9012345678	852 Walnut Ave	1980-08-12	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
9	David	I	Wilson	2345678901	369 Oak St	1975-06-23	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
10	Jennifer	J	Taylor	3456789012	963 Elm Ave	1993-04-17	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
11	James	K	Anderson	4567890123	852 Pine St	1988-10-29	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
12	Linda	L	Thomas	5678901234	741 Birch Ave	1977-12-08	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
13	Charles	M	Harris	6789012345	159 Cedar St	1996-01-14	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
14	Patricia	N	Clark	7890123456	357 Maple St	1984-07-07	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
15	Daniel	O	Lewis	8901234567	258 Walnut Ave	1981-09-03	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
16	Elizabeth	P	Lee	9012345678	963 Oak St	1976-11-19	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
17	Matthew	Q	Walker	0123456789	852 Elm Ave	1994-05-26	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
18	Karen	R	Perez	1234567890	741 Pine St	1983-03-09	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
19	Christopher	S	Hall	2345678901	369 Birch Ave	1979-02-13	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
20	Sarah	T	Young	3456789012	159 Cedar St	1997-08-27	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
21	Andrew	U	Allen	4567890123	357 Maple St	1986-12-21	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
22	Nancy	V	King	5678901234	258 Walnut Ave	1989-06-04	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
23	James	W	Wright	6789012345	963 Oak St	1980-04-30	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
24	Margaret	X	Lopez	7890123456	852 Elm Ave	1995-10-12	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
25	Robert	Y	Hill	8901234567	741 Pine St	1974-01-07	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
26	Susan	Z	Scott	9012345678	369 Birch Ave	1991-07-22	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
27	Michael	AA	Green	0123456789	159 Cedar St	1987-09-14	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
28	Karen	BB	Adams	1234567890	357 Maple St	1973-02-08	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
29	David	CC	Baker	2345678901	258 Walnut Ave	1998-06-01	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
30	Lisa	DD	Gonzalez	3456789012	963 Oak St	1981-04-25	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
31	Richard	EE	Nelson	4567890123	852 Elm Ave	1996-11-10	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
32	Karen	FF	Carter	5678901234	741 Pine St	1978-08-16	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
33	Betty	GG	Roberts	6789012345	369 Birch Ave	1983-05-03	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
34	Matthew	HH	Turner	7890123456	159 Cedar St	1990-03-19	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
35	Linda	II	Phillips	8901234567	357 Maple St	1976-12-02	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
36	Anthony	JJ	Campbell	9012345678	258 Walnut Ave	1989-10-27	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
37	Dorothy	KK	Evans	0123456789	963 Oak St	1984-07-13	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
38	Charles	LL	Murphy	1234567890	852 Elm Ave	1977-02-28	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
39	Ashley	MM	Ortiz	2345678901	741 Pine St	1992-06-22	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
40	Jessica	NN	Gutierrez	3456789012	369 Birch Ave	1986-04-15	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
41	George	OO	Sullivan	4567890123	159 Cedar St	1995-12-09	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
42	Daniel	PP	Romero	5678901234	357 Maple St	1981-09-03	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
43	Sarah	QQ	Pierce	6789012345	258 Walnut Ave	1998-03-28	2024-03-14 12:23:37.758342+00	2024-03-14 12:23:37.758342+00	bao nguyen	bao nguyen	f
44	Nguyen Dang	Minh	Ngoc	123198027365	Distric 1 HCM city	2000-02-02	2024-03-14 12:43:40.759498+00	2024-03-14 12:43:40.759514+00	Bao Nguyen	Bao Nguyen	f
\.


--
-- Data for Name: tm_user_account; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.tm_user_account (id, tm_user_id, account, password, created, modified, created_by, modified_by, is_deleted) FROM stdin;
1	44	nbao0208	1234567890Ab	2024-03-14 12:43:40.802286+00	2024-03-14 12:43:40.802298+00	Bao Nguyen	Bao Nguyen	f
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
1	1	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
2	2	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
3	3	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
4	4	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
5	5	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
6	6	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
7	7	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
8	8	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
9	9	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
10	10	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
11	11	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
12	12	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
13	13	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
14	14	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
15	15	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
16	16	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
17	17	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
18	18	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
19	19	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
20	20	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
21	21	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
22	22	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
23	23	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
24	24	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
25	25	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
26	26	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
27	27	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
28	28	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
29	29	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
30	30	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
31	31	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
32	32	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
33	33	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
34	34	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
35	35	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
36	36	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
37	37	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
38	38	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
39	39	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
40	40	2	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
41	41	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
42	42	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
43	43	1	2024-03-14 12:24:28.503044+00	2024-03-14 12:24:28.503044+00	bao nguyen	bao nguyen	f
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

SELECT pg_catalog.setval('public.tm_answer_id_seq', 5, true);


--
-- Name: tm_answer_tm_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_answer_tm_question_id_seq', 1, false);


--
-- Name: tm_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_category_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.tm_group_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.tm_lesson_id_seq', 100, true);


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

SELECT pg_catalog.setval('public.tm_question_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.tm_report_id_seq', 3, true);


--
-- Name: tm_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_tag_id_seq', 10, true);


--
-- Name: tm_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_test_id_seq', 2, true);


--
-- Name: tm_test_tm_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_test_tm_lesson_id_seq', 1, false);


--
-- Name: tm_user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_account_id_seq', 1, true);


--
-- Name: tm_user_account_tm_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.tm_user_account_tm_user_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.tm_user_group_id_seq', 43, true);


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

SELECT pg_catalog.setval('public.tm_user_id_seq', 44, true);


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
-- Name: tm_user_account tm_user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_account
    ADD CONSTRAINT tm_user_account_pkey PRIMARY KEY (id);


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
-- Name: tm_user_account fk_tm_user_id_user_account; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.tm_user_account
    ADD CONSTRAINT fk_tm_user_id_user_account FOREIGN KEY (tm_user_id) REFERENCES public.tm_user(id);


--
-- PostgreSQL database dump complete
--

