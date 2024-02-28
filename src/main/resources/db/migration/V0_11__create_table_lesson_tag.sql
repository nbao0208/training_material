DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_lesson_tag"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_lesson_id   BIGSERIAL                NOT NULL,
            tm_tag_id      BIGSERIAL                NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_lesson_id_tm_lesson_tag FOREIGN KEY (tm_lesson_id) REFERENCES public."tm_lesson" (id),
            CONSTRAINT FK_tm_tag_id_tm_lesson_tag FOREIGN KEY (tm_tag_id) REFERENCES public."tm_tag" (id)
            );

        COMMENT ON TABLE public."tm_lesson_tag" IS 'Lesson and tag table where connect between them';

        COMMENT ON COLUMN "tm_lesson_tag".id IS 'The ID of the lesson and tag table, this is unique value';
        COMMENT ON COLUMN "tm_lesson_tag".tm_lesson_id IS 'The lesson ID is a connective value to the lesson table';
        COMMENT ON COLUMN "tm_lesson_tag".tm_tag_id IS 'The tag ID is a connective value to the tag table';
        COMMENT ON COLUMN "tm_lesson_tag".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_lesson_tag".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_lesson_tag".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_lesson_tag".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_lesson_tag".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_lesson_tag (tm_lesson_id, tm_tag_id, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             l.id AS tm_lesson_id,
--             t.id AS tm_tag_id,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_lesson l
--                 CROSS JOIN
--             public.tm_tag t;
    END
$$