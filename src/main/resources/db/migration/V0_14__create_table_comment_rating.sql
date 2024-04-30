DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_comment_rating"
        (
            id                  BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_comment_template_id BIGSERIAL             NOT NULL,
            tm_user_lesson_id            BIGSERIAL       NOT NULL ,
            created             TIMESTAMP WITH TIME ZONE NOT NULL,
            modified            TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by          VARCHAR(30)              NOT NULL,
            modified_by         VARCHAR(30)              NOT NULL,
            is_deleted          BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_comment_template_id_tm_comment_rating FOREIGN KEY(tm_comment_template_id) REFERENCES public."tm_comment_template" (id),
            CONSTRAINT FK_tm_user_id_tm_comment_rating FOREIGN KEY (tm_user_lesson_id) REFERENCES public."tm_user_lesson" (id)
            );

        COMMENT ON TABLE public."tm_comment_rating" IS 'Comment and rating table';

        COMMENT ON COLUMN "tm_comment_rating".id IS 'The ID of this table and it is unique';
        COMMENT ON COLUMN "tm_comment_rating".tm_comment_template_id IS 'The ID of tm_comment_template table and this is a foreign key';
        COMMENT ON COLUMN "tm_comment_rating".tm_user_lesson_id IS 'The ID take from the users_lesson table because this users must have been learning the lesson';
        COMMENT ON COLUMN "tm_comment_rating".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_comment_rating".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_comment_rating".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_comment_rating".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_comment_rating".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_comment_rating (tm_rating_id, tm_comment_template_id, tm_user_id, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             r.id AS tm_rating_id,
--             c.id AS tm_comment_template_id,
--             u.id AS tm_user_id,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_rating r
--                 CROSS JOIN
--             public.tm_comment_template c
--                 INNER JOIN
--             public.tm_user_lesson u ON r.id = u.tm_user_id;

END
$$