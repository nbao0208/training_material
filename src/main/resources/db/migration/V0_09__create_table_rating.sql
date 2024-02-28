DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_rating
        (
            id          BIGSERIAL                NOT NULL PRIMARY KEY,
            level       INT CHECK ( level >= 1 AND level <= 5 ),
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
            );

        COMMENT ON TABLE public."tm_rating" IS 'tm_rating table';

        COMMENT ON COLUMN "tm_rating".id IS 'tm_rating ID is unique value';
        COMMENT ON COLUMN "tm_rating".level IS 'The level of users rating';
        COMMENT ON COLUMN "tm_rating".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_rating".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_rating".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_rating".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_rating".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_rating (level, created, modified, created_by, modified_by, is_deleted)
--         VALUES
--             (1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false);
    END
$$