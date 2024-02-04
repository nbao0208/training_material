DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."user_test"
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            user_id     VARCHAR(10)              NOT NULL,
            test_id     VARCHAR(10)              NOT NULL,
            score       INT CHECK ( score >= 0 ),
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (user_id) REFERENCES public."user_lesson" (user_id),
            FOREIGN KEY (test_id) REFERENCES public."test" (id)
        );

        COMMENT ON TABLE public."user_test" IS 'User and test table';

        COMMENT ON COLUMN "user_test".id IS 'The ID of this table and this is unique';
        COMMENT ON COLUMN "user_test".user_id IS 'The user_id from user_lesson that have done the lesson';
        COMMENT ON COLUMN "user_test".test_id IS 'The test_id from test table';
        COMMENT ON COLUMN "user_test".score IS 'The score of user doing test';
        COMMENT ON COLUMN "user_test".created IS 'Have been created by who';
        COMMENT ON COLUMN "user_test".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "user_test".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "user_test".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "user_test".is_deleted IS 'Have this table been deleted';
    END
$$