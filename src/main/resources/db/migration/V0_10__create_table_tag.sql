DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tm_tag
        (
            id          BIGSERIAL                                  NOT NULL PRIMARY KEY,
            level       INT CHECK ( level >= 1 AND tm_tag.level <= 3) NOT NULL,
            substance   VARCHAR(30)                                NOT NULL,
            created     TIMESTAMP WITH TIME ZONE                   NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE                   NOT NULL,
            created_by  VARCHAR(30)                                NOT NULL,
            modified_by VARCHAR(30)                                NOT NULL,
            is_deleted  BOOLEAN                                    NOT NULL
            );

        COMMENT ON TABLE public."tm_tag" IS 'tm_tag table';

        COMMENT ON COLUMN "tm_tag".id IS 'tm_tag ID is a unique value';
        COMMENT ON COLUMN "tm_tag".level IS 'The level of the category for a tm_tag from 1 to 3';
        COMMENT ON COLUMN "tm_tag".substance IS 'The content of each tm_tag';
        COMMENT ON COLUMN "tm_tag".created IS 'Have been created by who';
        COMMENT ON COLUMN "tm_tag".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tm_tag".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tm_tag".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tm_tag".is_deleted IS 'Have this table been deleted';

--         INSERT INTO public.tm_tag (level, substance, created, modified, created_by, modified_by, is_deleted)
--         VALUES
--             (1, 'Beginner', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (2, 'Intermediate', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (3, 'Advanced', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (1, 'Basic', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (2, 'Elementary', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (3, 'Proficient', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (1, 'Novice', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (2, 'Skilled', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (3, 'Expert', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false),
--             (1, 'Fundamental', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bao nguyen', 'bao nguyen', false);
    END
$$