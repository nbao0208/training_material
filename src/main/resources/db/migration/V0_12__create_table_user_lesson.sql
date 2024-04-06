DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_user_lesson"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_user_id    BIGSERIAL                 NOT NULL,
            tm_lesson_id   BIGSERIAL                NOT NULL,
            tm_report_id   BIGSERIAL                NOT NULL,
            view         INT CHECK (view >= 0)    NOT NULL,
            time_reading TIME                     NOT NULL,
            evaluation   INT,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_user_id_tm_user_lesson FOREIGN KEY (tm_user_id) REFERENCES public."tm_user" (id),
            CONSTRAINT FK_tm_lesson_id_tm_user_lesson FOREIGN KEY (tm_lesson_id) REFERENCES public."tm_lesson" (id),
            CONSTRAINT FK_tm_report_id_tm_user_lesson FOREIGN KEY (tm_report_id) REFERENCES public."tm_report" (id)
            );

        COMMENT ON TABLE public."tm_user_lesson" IS 'users-Lesson table';

        COMMENT ON COLUMN "tm_user_lesson".id IS 'The ID of users and lesson table, this is unique value';
        COMMENT ON COLUMN "tm_user_lesson".tm_user_id IS 'The tm_user ID is a connective value to the users table';
        COMMENT ON COLUMN "tm_user_lesson".tm_lesson_id IS 'The tm_lesson ID is a connective value to the lesson table';
        COMMENT ON COLUMN "tm_user_lesson".tm_report_id IS 'The tm_report ID is a connective value to the report table';
        COMMENT ON COLUMN "tm_user_lesson".view IS 'The times that users seeing this lesson';
        COMMENT ON COLUMN "tm_user_lesson".time_reading IS 'The total time that the users viewing this lesson';
        COMMENT ON COLUMN "tm_user_lesson".evaluation IS 'The comment of the users about the quality of the lesson';
        COMMENT ON COLUMN "tm_user_lesson".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_user_lesson".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_user_lesson".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_user_lesson".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_user_lesson".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_user_lesson (tm_user_id, tm_lesson_id, tm_report_id, view, time_reading, evaluation, created, modified, created_by, modified_by, is_deleted)
--         SELECT DISTINCT
--             u.id AS tm_user_id,
--             l.id AS tm_lesson_id,
--             r.id AS tm_report_id,
--             FLOOR(RANDOM() * 100) AS view,
--             INTERVAL '1 hour' * FLOOR(RANDOM() * 24) +
--             INTERVAL '1 minute' * FLOOR(RANDOM() * 60) +
--             INTERVAL '1 second' * FLOOR(RANDOM() * 60) AS time_reading,
--             FLOOR(RANDOM() * 6) AS evaluation,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_user u
--             CROSS JOIN
--             public.tm_lesson l
--             CROSS JOIN
--             public.tm_report r;

END
$$