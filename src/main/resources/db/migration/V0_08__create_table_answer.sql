DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_answer
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            answer      TEXT                     NOT NULL,
            tm_question_id BIGSERIAL                NOT NULL,
            is_correct  BOOLEAN                  NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            CONSTRAINT FK_tm_question_id_tm_answer FOREIGN KEY (tm_question_id) REFERENCES public."tm_question" (id)
            );

        COMMENT ON TABLE public."tm_answer" IS 'tm_answer table';

        COMMENT ON COLUMN "tm_answer".id IS 'tm_answer ID is a unique value';
        COMMENT ON COLUMN "tm_answer".answer IS 'The answer of the tm_question';
        COMMENT ON COLUMN "tm_answer".tm_question_id IS 'tm_question ID is a connective value to tm_question table';
        COMMENT ON COLUMN "tm_answer".is_correct IS 'The answer of users is correct or not';
        COMMENT ON COLUMN "tm_answer".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_answer".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_answer".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_answer".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_answer".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_answer (answer, tm_question_id, is_correct, created, modified, created_by, modified_by, is_deleted)
--         SELECT
--             CASE
--                 WHEN q.question_type = 'Multiple Choice' THEN
--                     CASE
--                         WHEN a.choice = 1 THEN 'A'
--                         WHEN a.choice = 2 THEN 'B'
--                         WHEN a.choice = 3 THEN 'C'
--                         WHEN a.choice = 4 THEN 'D'
--                     END
--                 ELSE
--                     'Random answer for Essay question ' || q.id
--                 END AS answer,
--             q.id AS tm_question_id,
--             CASE
--                 WHEN q.question_type = 'Multiple Choice' AND a.choice = 1 THEN true
--                 ELSE false
--                 END AS is_correct,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM public.tm_question q
--                  CROSS JOIN LATERAL generate_series(1, 4) a(choice)
--         WHERE q.question_type = 'Multiple Choice'
--         UNION ALL
--         SELECT
--             'Random tm_answer for Essay question ' || q.id AS answer,
--             q.id AS tm_question_id,
--             false AS is_correct,
--             CURRENT_TIMESTAMP AS created,
--             CURRENT_TIMESTAMP AS modified,
--             'bao nguyen' AS created_by,
--             'bao nguyen' AS modified_by,
--             false AS is_deleted
--         FROM public.tm_question q
--         WHERE q.question_type = 'Essay';
    END
$$