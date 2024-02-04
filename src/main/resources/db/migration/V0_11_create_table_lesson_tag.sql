DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."lesson_tag"
        (
            id          VARCHAR(10)              NOT NULL PRIMARY KEY,
            lesson_id   VARCHAR(10)              NOT NULL,
            tag_id      VARCHAR(10)              NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            created_by  VARCHAR(30)              NOT NULL,
            modified_by VARCHAR(30)              NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL,
            FOREIGN KEY (lesson_id) REFERENCES public."lesson" (id),
            FOREIGN KEY (tag_id) REFERENCES public."tag" (id)
        );

        COMMENT ON TABLE public."lesson_tag" IS 'Lesson and tag table where connect between them';

        COMMENT ON COLUMN "lesson_tag".id IS 'The ID of the lesson and tag table, this is unique value';
        COMMENT ON COLUMN "lesson_tag".lesson_id IS 'The lesson ID is a connective value to the lesson table';
        COMMENT ON COLUMN "lesson_tag".tag_id IS 'The tag ID is a connective value to the tag table';
        COMMENT ON COLUMN "lesson_tag".created IS 'Have been created by who';
        COMMENT ON COLUMN "lesson_tag".modified IS 'Have been modified by who';
        COMMENT ON COLUMN "lesson_tag".created_by IS 'Who have been create this table';
        COMMENT ON COLUMN "lesson_tag".modified_by IS 'Who have been modify this table';
        COMMENT ON COLUMN "lesson_tag".is_deleted IS 'Have this table been deleted';
    END
$$