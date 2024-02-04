DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.lesson
        (
            id           VARCHAR(10)              NOT NULL PRIMARY KEY,
            category_id  VARCHAR(10)              NOT NULL,
            content_link VARCHAR(40)              NOT NULL,
            title        TEXT                     NOT NULL,
            intro        TEXT                     NOT NULL,
            test_id      VARCHAR(10)              NOT NULL,
            created      TIMESTAMP WITH TIME ZONE NOT NULL,
            modified     TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by   VARCHAR(30)              NOT NULL,
            modified_by  VARCHAR(30)              NOT NULL,
            is_deleted   BOOLEAN                  NOT NULL,
            FOREIGN KEY (category_id) REFERENCES public."category" (id),
            FOREIGN KEY (test_id) REFERENCES public."test" (id)
        );

        COMMENT ON TABLE public."lesson" IS 'Lesson table';

        COMMENT ON COLUMN "lesson".id IS 'Lesson ID is a unique value';
        COMMENT ON COLUMN "lesson".test_id IS 'Test ID is a connective value to test table';
        COMMENT ON COLUMN "lesson".content_link IS 'The link to the pdf document or a video';
        COMMENT ON COLUMN "lesson".title IS 'A title of the lesson';
        COMMENT ON COLUMN "lesson".intro IS 'A script of introduction about the lessons';
        COMMENT ON COLUMN "lesson".category_id IS 'Category ID is a connective value to category table';
        COMMENT ON COLUMN "lesson".created IS 'Have been created by who';
        COMMENT ON COLUMN "lesson".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "lesson".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "lesson".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "lesson".is_deleted IS 'Have this table been deleted';
    END
$$