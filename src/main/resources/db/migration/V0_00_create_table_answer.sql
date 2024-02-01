DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.answer
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            answer      TEXT                     NOT NULL,
            question_id VARCHAR(10)              NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (question_id) REFERENCES public."question" (id)
        );

        COMMENT ON TABLE public."answer" IS 'answer table';

        COMMENT ON COLUMN "answer".id IS 'Answer ID is a unique value';
        COMMENT ON COLUMN "answer".answer IS 'The answer of the question';
        COMMENT ON COLUMN "answer".question_id IS 'Question ID is a connective value to question table';
        COMMENT ON COLUMN "answer".created IS 'Have been created by who';
        COMMENT ON COLUMN "answer".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "answer".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "answer".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "answer".is_deleted IS 'Have this table been deleted';
    END
$$