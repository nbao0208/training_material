DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.test
        (
            id          VARCHAR(10)                            NOT NULL PRIMARY KEY,
            title       VARCHAR(50)                            NOT NULL,
            rule        TEXT                                   NOT NULL,
            created     TIMESTAMP WITH TIME ZONE               NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE               NOT NULL,
            created_by  VARCHAR(30)                            NOT NULL,
            modified_by VARCHAR(30)                            NOT NULL,
            is_deleted  BOOLEAN                                NOT NULL
        );

        COMMENT ON TABLE public."test" IS 'Test table';

        COMMENT ON COLUMN "test".id IS 'Test ID is a unique value';
        COMMENT ON COLUMN "test".title IS 'A title of the test show what happening in this exam';
        COMMENT ON COLUMN "test".rule IS 'A rule of teacher in this test';
        COMMENT ON COLUMN "test".created IS 'Have been created by who';
        COMMENT ON COLUMN "test".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "test".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "test".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "test".is_deleted IS 'Have this table been deleted';
    END
$$