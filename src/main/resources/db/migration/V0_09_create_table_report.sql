DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.report
        (
            id           VARCHAR(10)              NOT NULL PRIMARY KEY,
            status       VARCHAR(30)              NOT NULL,
            view         INT CHECK (view >= 0)    NOT NULL,
            time_reading TIME                     NOT NULL,
            evaluation   INT,
            created      TIMESTAMP WITH TIME ZONE NOT NULL,
            modified     TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by   VARCHAR(30)              NOT NULL,
            modified_by  VARCHAR(30)              NOT NULL,
            is_deleted   BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE public."report" IS 'Report table';

        COMMENT ON COLUMN "report".id IS 'Report ID is unique value';
        COMMENT ON COLUMN "report".status IS 'The status of user in this lesson(have not done, doing, done)';
        COMMENT ON COLUMN "report".view IS 'The times that user seeing this lesson';
        COMMENT ON COLUMN "report".time_reading IS 'The total time that the user viewing this lesson';
        COMMENT ON COLUMN "report".evaluation IS 'The comment of the user about the quality of the lesson';
        COMMENT ON COLUMN "report".created IS 'Have been created by who';
        COMMENT ON COLUMN "report".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "report".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "report".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "report".is_deleted IS 'Have this table been deleted';
    END
$$