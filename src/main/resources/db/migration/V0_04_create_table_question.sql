DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.question
        (
            id            VARCHAR(10)              NOT NULL primary key,
            test_id       VARCHAR(10)              NOT NULL,
            question      VARCHAR                  NOT NULL,
            question_type VARCHAR(20)              NOT NULL,
            created       TIMESTAMP WITH TIME ZONE NOT NULL,
            modified      TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by    VARCHAR(30)              NOT NULL,
            modified_by   VARCHAR(30)              NOT NULL,
            is_deleted    BOOLEAN                  NOT NULL,
            FOREIGN KEY (test_id) REFERENCES public."test" (id)
        );

        COMMENT ON TABLE public."question" IS 'Question table';

        COMMENT ON COLUMN "question".id IS 'Question ID is a unique value';
        COMMENT ON COLUMN "question".test_id IS 'Test ID is a connective value to test table';
        COMMENT ON COLUMN "question".question IS 'The question for each sentence';
        COMMENT ON COLUMN "question".question_type IS 'The type of the question/sentence';
        COMMENT ON COLUMN "question".created IS 'Have been created by who';
        COMMENT ON COLUMN "question".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "question".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "question".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "question".is_deleted IS 'Have this table been deleted';
    END
$$