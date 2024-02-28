DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_question
        (
            id            BIGSERIAL                NOT NULL primary key,
            tm_test_id       BIGSERIAL                NOT NULL,
            question      TEXT                     NOT NULL,
            question_type VARCHAR(20)              NOT NULL,
            created       TIMESTAMP WITH TIME ZONE NOT NULL,
            modified      TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by    VARCHAR(30)              NOT NULL,
            modified_by   VARCHAR(30)              NOT NULL,
            is_deleted    BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_test_id_tm_question FOREIGN KEY (tm_test_id) REFERENCES public."tm_test" (id)
            );

        COMMENT ON TABLE public."tm_question" IS 'tm_question table';

        COMMENT ON COLUMN "tm_question".id IS 'tm_question ID is a unique value';
        COMMENT ON COLUMN "tm_question".tm_test_id IS 'tm_test ID is a connective value to tm_test table';
        COMMENT ON COLUMN "tm_question".question IS 'The question for each sentence';
        COMMENT ON COLUMN "tm_question".question_type IS 'The type of the question/sentence';
        COMMENT ON COLUMN "tm_question".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_question".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_question".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_question".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_question".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_question (tm_test_id, question, question_type, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             t.id AS tm_test_id,
--             'tm_question ' || q || ' for test ' || t.id AS question,
--             CASE
--                 WHEN random() < 0.5 THEN 'Multiple Choice'
--                 ELSE 'Essay'
--                 END AS question_type,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM public.tm_test t
--                  CROSS JOIN LATERAL generate_series(10, (RANDOM() * 30 + 20)::int) q;
    END
$$