DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_test
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_lesson_id   BIGSERIAL                NOT NULL,
            title       TEXT                     NOT NULL,
            rule        TEXT                     NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_lesson_id_tm_test FOREIGN KEY (tm_lesson_id) REFERENCES public."tm_lesson" (id)
            );

        COMMENT ON TABLE public."tm_test" IS 'tm_test table';

        COMMENT ON COLUMN "tm_test".id IS 'tm_test ID is a unique value';
        COMMENT ON COLUMN "tm_test".tm_lesson_id IS 'The ID of the tm_lesson from tm_lesson table';
        COMMENT ON COLUMN "tm_test".title IS 'A title of the tm_test show what happening in this exam';
        COMMENT ON COLUMN "tm_test".rule IS 'A rule of teacher in this tm_test';
        COMMENT ON COLUMN "tm_test".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_test".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_test".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_test".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_test".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_test (tm_lesson_id, title, rule, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             id AS tm_lesson_id,
--             'tm_test for tm_lesson ' || id AS title,
--             'Rules for tm_test ' || id AS rule,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM public.tm_lesson
--         ORDER BY id
--             LIMIT 100;
    END
$$