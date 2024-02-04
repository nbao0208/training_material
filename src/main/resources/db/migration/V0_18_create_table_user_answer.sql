DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."user_answer"
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            user_id     VARCHAR(10)              NOT NULL,
            answer_id   VARCHAR(10)              NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (user_id) REFERENCES public."user_test" (user_id),
            FOREIGN KEY (answer_id) REFERENCES public."answer" (id)
        );

        COMMENT ON TABLE public."user_answer" IS 'The table of user and those answers';

        COMMENT ON COLUMN "user_answer".id IS 'The ID of this table and this is unique';
        COMMENT ON COLUMN "user_answer".user_id IS 'This user ID is take from the user_test table because the user have answer must have been doing test';
        COMMENT ON COLUMN "user_answer".answer_id IS 'This is the answer ID from the answer table';
        COMMENT ON COLUMN "user_answer".created IS 'Have been created by who';
        COMMENT ON COLUMN "user_answer".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "user_answer".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "user_answer".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "user_answer".is_deleted IS 'Have this table been deleted';
    END
$$