DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.category
        (
            id            VARCHAR(10)              NOT NULL PRIMARY KEY,
            category_name VARCHAR(40)              NOT NULL,
            created       TIMESTAMP WITH TIME ZONE NOT NULL,
            modified      TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by    VARCHAR(30)              NOT NULL,
            modified_by   VARCHAR(30)              NOT NULL,
            is_deleted    BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE public."category" IS 'Category table';

        COMMENT ON COLUMN "category".id IS 'Category ID is a unique value';
        COMMENT ON COLUMN "category".category_name IS 'The genus of category same like type';
        COMMENT ON COLUMN "category".created IS 'Have been created by who';
        COMMENT ON COLUMN "category".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "category".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "category".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "category".is_deleted IS 'Have this table been deleted';
    END
$$