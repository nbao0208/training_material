DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."tm_user_test"
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            tm_user_lesson_id    BIGSERIAL         NOT NULL,
            tm_test_id     BIGSERIAL                NOT NULL,
            score       INT CHECK ( score >= 0 ),
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_user_lesson_id_tm_user_test FOREIGN KEY (tm_user_lesson_id) REFERENCES public."tm_user_lesson" (id),
            CONSTRAINT FK_tm_test_id_tm_user_test FOREIGN KEY (tm_test_id) REFERENCES public."tm_test" (id)
            );

        COMMENT ON TABLE public."tm_user_test" IS 'users and test table';

        COMMENT ON COLUMN "tm_user_test".id IS 'The ID of this table and this is unique';
        COMMENT ON COLUMN "tm_user_test".tm_user_lesson_id IS 'The id from users_lesson that have done the lesson';
        COMMENT ON COLUMN "tm_user_test".tm_test_id IS 'The test_id from test table';
        COMMENT ON COLUMN "tm_user_test".score IS 'The score of users doing test';
        COMMENT ON COLUMN "tm_user_test".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_user_test".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_user_test".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_user_test".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_user_test".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_user_test (tm_user_id, tm_test_id, score, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             ul.tm_user_id,
--             t.id AS tm_test_id,
--             FLOOR(RANDOM() * 11) AS score,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM
--             public.tm_user_lesson ul
--                 CROSS JOIN
--             public.tm_test t;
    END
$$