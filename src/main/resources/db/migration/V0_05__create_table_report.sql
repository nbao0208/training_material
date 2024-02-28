DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_report
        (
            id           BIGSERIAL                NOT NULL PRIMARY KEY,
            status       VARCHAR(30)              NOT NULL,

            created      TIMESTAMP WITH TIME ZONE NOT NULL,
            modified     TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by   VARCHAR(30)              NOT NULL,
            modified_by  VARCHAR(30)              NOT NULL,
            is_deleted   BOOLEAN                  NOT NULL
            );

        COMMENT ON TABLE public."tm_report" IS 'tm_report table';

        COMMENT ON COLUMN "tm_report".id IS 'tm_report ID is unique value';
        COMMENT ON COLUMN "tm_report".status IS 'The status of users in this lesson(have not done, doing, done)';
        COMMENT ON COLUMN "tm_report".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_report".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_report".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_report".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_report".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_report (status, created, modified, created_by, modified_by, is_deleted)
--         VALUES
--             ('have not done', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             ('doing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             ('done', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false);
    END
$$