DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public.lecture
        (
            id           VARCHAR(10)              NOT NULL primary key,
            content_link VARCHAR(40)              NOT NULL,
            title        VARCHAR(50)              NOT NULL,
            intro        TEXT                     NOT NULL,
            created      TIMESTAMP WITH TIME ZONE NOT NULL,
            modified     TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by   VARCHAR(30)              NOT NULL,
            modified_by  VARCHAR(30)              NOT NULL,
            is_deleted   BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE public."lecture" IS 'Lecture table';

        COMMENT ON COLUMN "lecture".id IS 'Lecture ID is a unique value';
        COMMENT ON COLUMN "lecture".content_link IS 'A link to a lesson document or lesson video';
        COMMENT ON COLUMN "lecture".title IS 'A title of the lesson';
        COMMENT ON COLUMN "lecture".intro IS 'A script of introduction about the lessons';
        COMMENT ON COLUMN "lecture".created IS 'Have been created by who';
        COMMENT ON COLUMN "lecture".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "lecture".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "lecture".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "lecture".is_deleted IS 'Have this table been deleted';
    END
$$