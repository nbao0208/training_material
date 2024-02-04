DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.tag
        (
            id          VARCHAR(10)                                NOT NULL PRIMARY KEY,
            level       INT CHECK ( level >= 1 AND tag.level <= 3) NOT NULL,
            substance   VARCHAR(30)                                NOT NULL,
            created     TIMESTAMP WITH TIME ZONE                   NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE                   NOT NULL,
            created_by  VARCHAR(30)                                NOT NULL,
            modified_by VARCHAR(30)                                NOT NULL,
            is_deleted  BOOLEAN                                    NOT NULL
        );

        COMMENT ON TABLE public."tag" IS 'Tag table';

        COMMENT ON COLUMN "tag".id IS 'Tag ID is a unique value';
        COMMENT ON COLUMN "tag".level IS 'The level of the category for a tag from 1 to 3';
        COMMENT ON COLUMN "tag".substance IS 'The content of each tag';
        COMMENT ON COLUMN "tag".created IS 'Have been created by who';
        COMMENT ON COLUMN "tag".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "tag".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "tag".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "tag".is_deleted IS 'Have this table been deleted';
    END
$$