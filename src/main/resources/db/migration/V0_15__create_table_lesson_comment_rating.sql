DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_lesson_comment_rating"
        (
            id                BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_comment_rating_id BIGSERIAL                NOT NULL,
            tm_lesson_id         BIGSERIAL                NOT NULL,
            created           TIMESTAMP WITH TIME ZONE NOT NULL,
            modified          TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by        VARCHAR(30)              NOT NULL,
            modified_by       VARCHAR(30)              NOT NULL,
            is_deleted        BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_comment_rating_id_tm_lesson_comment_rating FOREIGN KEY (tm_comment_rating_id) REFERENCES public."tm_comment_rating" (id),
            CONSTRAINT FK_tm_lesson_id_tm_lesson_comment_rating FOREIGN KEY (tm_lesson_id) REFERENCES public."tm_lesson" (id)
            );

        COMMENT ON TABLE public."tm_lesson_comment_rating" IS 'The table between comment_rating table and lesson table';

        COMMENT ON COLUMN "tm_lesson_comment_rating".id IS 'The ID of this table and it is unique';
        COMMENT ON COLUMN "tm_lesson_comment_rating".tm_comment_rating_id IS 'The connective value to the comment_rating table';
        COMMENT ON COLUMN "tm_lesson_comment_rating".tm_lesson_id IS 'The connective value to the lesson table';
        COMMENT ON COLUMN "tm_lesson_comment_rating".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_lesson_comment_rating".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_lesson_comment_rating".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_lesson_comment_rating".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_lesson_comment_rating".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_lesson_comment_rating (tm_comment_rating_id, tm_lesson_id, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             cr.id AS tm_comment_rating_id,
--             l.id AS tm_lesson_id,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_comment_rating cr
--                 CROSS JOIN
--             public.tm_lesson l
--         ORDER BY
--             RANDOM()
--             LIMIT
--             (SELECT COUNT(*) FROM public.tm_comment_rating) OFFSET (SELECT COUNT(*) FROM public.tm_comment_rating) * RANDOM();

END
$$