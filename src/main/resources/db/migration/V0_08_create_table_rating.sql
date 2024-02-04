DO
$$
    BEGIN

        CREATE TABLE IF NOT EXISTS public.rating
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            level       INT CHECK ( level >= 1 AND level <= 5 ),
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE public."rating" IS 'Rating table';

        COMMENT ON COLUMN "rating".id IS 'Rating ID is unique value';
        COMMENT ON COLUMN "rating".level IS 'The level of user rating';
        COMMENT ON COLUMN "rating".created IS 'Have been created by who';
        COMMENT ON COLUMN "rating".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "rating".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "rating".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "rating".is_deleted IS 'Have this table been deleted';
    END
$$